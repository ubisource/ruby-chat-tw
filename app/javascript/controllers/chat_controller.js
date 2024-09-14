import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
    static values = {currentUserId: String}

    connect() {
        console.log('chat_controller connected')
        this.setupScrollListener()
    }

    disconnect() {
        this.scrollObserver.disconnect()
    }

    setupScrollListener() {
        this.scrollToBottom()

        this.scrollObserver = new MutationObserver(() => {
            this.scrollToBottom()
        })

        this.scrollObserver.observe(this.element, {
            childList: true,
            subtree: true
        })
    }

    scrollToBottom() {
        this.element.scrollTop = this.element.scrollHeight
    }
}
