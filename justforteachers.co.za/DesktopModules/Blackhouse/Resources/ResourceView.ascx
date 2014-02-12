<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceView.ascx.cs" Inherits="Blackhouse.Resources.ResourceView" %>

<style>

    article,
    aside,
    details,
    figcaption,
    figure,
    footer,
    header,
    hgroup,
    main,
    nav,
    section,
    summary {
        display: block;
    }

    /**
         * Correct `inline-block` display not defined in IE 8/9.
         */
    audio,
    canvas,
    video {
        display: inline-block;
    }

        /**
         * Prevent modern browsers from displaying `audio` without controls.
         * Remove excess height in iOS 5 devices.
         */
        audio:not([controls]) {
            display: none;
            height: 0;
        }

    /**
         * Address `[hidden]` styling not present in IE 8/9.
         * Hide the `template` element in IE, Safari, and Firefox < 22.
         */
    [hidden],
    template {
        display: none;
    }

    /* ==========================================================================
           Base
           ========================================================================== */
    /**
         * 1. Set default font family to sans-serif.
         * 2. Prevent iOS text size adjust after orientation change, without disabling
         *    user zoom.
         */
    html {
        font-family: 'Source Sans Pro', sans-serif;
        /* 1 */
        -ms-text-size-adjust: 100%;
        /* 2 */
        -webkit-text-size-adjust: 100%;
        /* 2 */
        font-size: 16px;
    }

    /**
         * Remove default margin.
         */
    body {
        margin: 0;
    }

    *, *:before, *:after {
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    /* ==========================================================================
           Links
           ========================================================================== */
    /**
         * Remove the gray background color from active links in IE 10.
         */
    a {
        background: transparent;
    }

        /**
         * Address `outline` inconsistency between Chrome and other browsers.
         */
        a:focus {
            outline: thin dotted;
        }

        /**
         * Improve readability when focused and also mouse hovered in all browsers.
         */
        a:active,
        a:hover {
            outline: 0;
        }

    /* ==========================================================================
           Typography
           ========================================================================== */
    /**
         * Address variable `h1` font-size and margin within `section` and `article`
         * contexts in Firefox 4+, Safari 5, and Chrome.
         */
    h1 {
        font-size: 2em;
        margin: 0.67em 0;
    }

    h1, h2, h3, h4, h5, h6 {
        font-weight: 400;
    }

    /**
         * Address styling not present in IE 8/9, Safari 5, and Chrome.
         */
    abbr[title] {
        border-bottom: 1px dotted;
    }

    /**
         * Address style set to `bolder` in Firefox 4+, Safari 5, and Chrome.
         */
    b,
    strong {
        font-weight: bold;
    }

    /**
         * Address styling not present in Safari 5 and Chrome.
         */
    dfn {
        font-style: italic;
    }

    /**
         * Address differences between Firefox and other browsers.
         */
    hr {
        -moz-box-sizing: content-box;
        box-sizing: content-box;
        height: 0;
    }

    /**
         * Address styling not present in IE 8/9.
         */
    mark {
        background: #ff0;
        color: #000;
    }

    /**
         * Correct font family set oddly in Safari 5 and Chrome.
         */
    code,
    kbd,
    pre,
    samp {
        font-family: monospace, serif;
        font-size: 1em;
    }

    /**
         * Improve readability of pre-formatted text in all browsers.
         */
    pre {
        white-space: pre-wrap;
    }

    /**
         * Set consistent quote types.
         */
    q {
        quotes: "\201C" "\201D" "\2018" "\2019";
    }

    /**
         * Address inconsistent and variable font size in all browsers.
         */
    small {
        font-size: 80%;
    }

    /**
         * Prevent `sub` and `sup` affecting `line-height` in all browsers.
         */
    sub,
    sup {
        font-size: 75%;
        line-height: 0;
        position: relative;
        vertical-align: baseline;
    }

    sup {
        top: -0.5em;
    }

    sub {
        bottom: -0.25em;
    }

    /* ==========================================================================
           Embedded content
           ========================================================================== */
    /**
         * Remove border when inside `a` element in IE 8/9.
         */
    img {
        border: 0;
    }

    /**
         * Correct overflow displayed oddly in IE 9.
         */
    svg:not(:root) {
        overflow: hidden;
    }

    /* ==========================================================================
           Figures
           ========================================================================== */
    /**
         * Address margin not present in IE 8/9 and Safari 5.
         */
    figure {
        margin: 0;
    }

    /* ==========================================================================
           Forms
           ========================================================================== */
    /**
         * Define consistent border, margin, and padding.
         */
    fieldset {
        border: 1px solid #c0c0c0;
        margin: 0 2px;
        padding: 0.35em 0.625em 0.75em;
    }

    /**
         * 1. Correct `color` not being inherited in IE 8/9.
         * 2. Remove padding so people aren't caught out if they zero out fieldsets.
         */
    legend {
        border: 0;
        /* 1 */
        padding: 0;
        /* 2 */
    }

    /**
         * 1. Correct font family not being inherited in all browsers.
         * 2. Correct font size not being inherited in all browsers.
         * 3. Address margins set differently in Firefox 4+, Safari 5, and Chrome.
         */
    button,
    input,
    select,
    textarea {
        font-family: inherit;
        /* 1 */
        font-size: 100%;
        /* 2 */
        margin: 0;
        /* 3 */
    }

    /**
         * Address Firefox 4+ setting `line-height` on `input` using `!important` in
         * the UA stylesheet.
         */
    button,
    input {
        line-height: normal;
    }

    /**
         * Address inconsistent `text-transform` inheritance for `button` and `select`.
         * All other form control elements do not inherit `text-transform` values.
         * Correct `button` style inheritance in Chrome, Safari 5+, and IE 8+.
         * Correct `select` style inheritance in Firefox 4+ and Opera.
         */
    button,
    select {
        text-transform: none;
    }

    /**
         * 1. Avoid the WebKit bug in Android 4.0.* where (2) destroys native `audio`
         *    and `video` controls.
         * 2. Correct inability to style clickable `input` types in iOS.
         * 3. Improve usability and consistency of cursor style between image-type
         *    `input` and others.
         */
    button,
    html input[type="button"],
    input[type="reset"],
    input[type="submit"] {
        -webkit-appearance: button;
        /* 2 */
        cursor: pointer;
        /* 3 */
    }

        /**
         * Re-set default cursor for disabled elements.
         */
        button[disabled],
        html input[disabled] {
            cursor: default;
        }

    /**
         * 1. Address box sizing set to `content-box` in IE 8/9/10.
         * 2. Remove excess padding in IE 8/9/10.
         */
    input[type="checkbox"],
    input[type="radio"] {
        box-sizing: border-box;
        /* 1 */
        padding: 0;
        /* 2 */
    }

    /**
         * 1. Address `appearance` set to `searchfield` in Safari 5 and Chrome.
         * 2. Address `box-sizing` set to `border-box` in Safari 5 and Chrome
         *    (include `-moz` to future-proof).
         */
    input[type="search"] {
        -webkit-appearance: textfield;
        /* 1 */
        -moz-box-sizing: content-box;
        -webkit-box-sizing: content-box;
        /* 2 */
        box-sizing: content-box;
    }

        /**
         * Remove inner padding and search cancel button in Safari 5 and Chrome
         * on OS X.
         */
        input[type="search"]::-webkit-search-cancel-button,
        input[type="search"]::-webkit-search-decoration {
            -webkit-appearance: none;
        }

    /**
         * Remove inner padding and border in Firefox 4+.
         */
    button::-moz-focus-inner,
    input::-moz-focus-inner {
        border: 0;
        padding: 0;
    }

    /**
         * 1. Remove default vertical scrollbar in IE 8/9.
         * 2. Improve readability and alignment in all browsers.
         */
    textarea {
        overflow: auto;
        /* 1 */
        vertical-align: top;
        /* 2 */
    }

    /* ==========================================================================
           Tables
           ========================================================================== */
    /**
         * Remove most spacing between table cells.
         */
    table {
        border-collapse: collapse;
        border-spacing: 0;
    }

    .resource-btn {
        padding: 10px 20px;
        display: inline-block;
        border: 1px solid #3498db;
        color: #3498db;
        text-decoration: none;
        border-radius: 4px;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
    }

        .resource-btn:hover {
            color: #fff;
            background: #3498db;
        }

    .text,
    .select {
        width: 100%;
        border: 0;
        background: #f5f5f5;
        height: 36px;
        border-radius: 4px;
        -webkit-appearance: none;
        padding: 10px 15px;
        font-size: 14px;
    }

    .textarea {
        min-height: 150px;
        resize: none;
    }

    .resources-label {
        font-size: 13px;
    }

    .form-group {
        display: block;
        margin: 20px 0;
    }

    html, body, body > form {
        height: 100%;
    }

    @font-face {
        font-family: "icons";
        font-weight: normal;
        font-style: normal;
        src: url("../fonts/jft.eot");
        src: url("../fonts/jft.eot?#iefix") format("embedded-opentype"), url("../fonts/jft.ttf") format("truetype");
    }

    [data-icon]:before {
        font-family: 'icons';
        content: attr(data-icon);
        speak: none;
        font-weight: normal;
        font-variant: normal;
        text-transform: none;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
    }

    .toolbar {
        height: 44px;
        background: #383838;
    }

    .navbar {
        height: 100px;
        background: #fff;
        width: 100%;
    }

    .header {
        background-size: cover;
        background-position: center center;
        position: relative;
        overflow: hidden;
        width: 100%;
        padding: 5px;
        line-height: 24px;
    }

    @media all and (min-width: 48em) {
        .homepage.navbar {
            position: fixed;
            width: 100%;
            z-index: 1;
        }

        .header.homepage {
            position: fixed;
            top: 100px;
            bottom: 3%;
            width: 100%;
            height: auto;
        }
    }

    .header-background {
        min-width: 100%;
        min-height: 100%;
        max-height: 120%;
        display: block;
        position: absolute;
    }

    .header-blurb {
        text-align: center;
        color: #fff;
        font-weight: 200;
        padding: 0 30px;
        position: absolute;
        width: 100%;
        bottom: 30px;
        font-size: 16px;
    }

        .header-blurb h1 {
            margin: 0;
            font-weight: 200;
        }

        .header-blurb p {
            margin: 0 auto 20px auto;
            font-weight: 200;
            max-width: 480px;
        }

    .page-title {
        margin: 0;
        font-weight: 200;
        color: #fff;
        position: relative;
        max-width: 1280px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .navbar-inner {
        margin: 0 auto;
        max-width: 1280px;
    }

    .menu {
        list-style: none;
        margin: 0;
        padding: 0;
        float: right;
    }

    .logo {
        max-height: 100%;
        float: left;
    }

        .logo img {
            display: block;
            max-height: 100%;
        }

    .menu > li {
        float: left;
        background: #fff;
        color: #3498db;
    }

    .menu a {
        float: left;
        line-height: 100px;
        padding: 0 25px;
        font-size: 14px;
        text-decoration: none;
        text-transform: uppercase;
        text-align: center;
        color: inherit;
    }

    .menu .active,
    .menu li:hover {
        text-decoration: underline;
        color: #196090;
    }

    .menu > li div {
        display: none;
    }

    .content {
        background: #fff;
    }

    @media all and (min-width: 48em) {
        .homepage ~ .content {
            position: relative;
            top: 97%;
        }
    }

    .content-inner {
        max-width: 1280px;
        margin: 0 auto;
        padding: 30px;
    }

    .content-section {
        overflow: hidden;
    }

    .right-pane {
        float: right;
        width: 300px;
        min-height: 250px;
    }

        .right-pane + .content-pane {
            margin-right: 330px;
        }

    .header-btn {
        background: #fff;
        color: #3498db;
        border-color: #fff;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
    }

        .header-btn:hover {
            background: #3498db;
            color: #fff;
            border-color: #3498db;
        }

    .feature-block,
    .trending-block {
        width: 98%;
        float: left;
        margin: 20px 1% 0 1%;
    }

    @media all and (min-width: 48em) {
        .feature-block,
        .trending-block {
            width: 31%;
        }
    }

    .feature-icon {
        width: 96px;
        text-align: center;
        margin: 20px auto;
        height: 96px;
        border-radius: 50%;
        background: #f5f5f5;
        color: #3498db;
        line-height: 106px;
        font-size: 36px;
        display: block;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
    }

        .feature-icon:hover {
            font-size: 44px;
            box-shadow: 0 0 0 4px #f5f5f5;
        }

    .feature-title {
        font-weight: 200;
        text-align: center;
        margin: 20px 30px;
    }

    .feature-description {
        font-weight: 200;
        line-height: 1.6em;
        text-align: center;
        margin: 20px auto;
        padding: 20px 30px 0 30px;
        position: relative;
        max-width: 480px;
        color: #888;
    }

        .feature-description:after {
            width: 50px;
            position: absolute;
            top: -1px;
            left: 50%;
            margin-left: -25px;
            height: 3px;
            background: #3498db;
            content: "";
        }

        .feature-description:before {
            width: 200px;
            position: absolute;
            top: 0;
            left: 50%;
            margin-left: -100px;
            height: 1px;
            background: #e5e5e5;
            content: "";
        }

    .feature-block h3 {
        color: #fff;
        margin: 20px 0 0 0;
        padding: 10px 13px;
    }

    .feature-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

        .feature-list li {
            padding: 1px 13px;
        }

        .feature-list h4 {
            margin: 10px 0 0 0;
            font-size: 18px;
            font-weight: 700;
        }

        .feature-list p {
            margin: 0 0 10px 0;
            font-size: 14px;
        }

    .trending-items {
        background: #f5f5f5;
        border-top: 3px solid #3498db;
    }

    .trending-block {
        padding: 0 30px 20px 30px;
    }

        .trending-block h3 {
            margin: 0;
            font-weight: 200;
            border-bottom: 1px solid #e5e5e5;
            padding-bottom: 5px;
            position: relative;
            vertical-align: baseline;
        }

            .trending-block h3:after {
                width: 50px;
                position: absolute;
                bottom: -2px;
                left: 0;
                height: 3px;
                background: #3498db;
                content: "";
            }

    .trending-list {
        margin: 0;
        padding: 0;
        list-style: none;
    }

        .trending-list li {
            border-bottom: 1px solid #e5e5e5;
        }

        .trending-list a {
            padding: 15px 20px 15px 0;
            text-decoration: none;
            display: block;
            position: relative;
            color: #3498db;
        }

            .trending-list a:before {
                right: 0;
                top: 50%;
                margin-top: -8px;
                position: absolute;
            }

        .trending-list p {
            font-weight: 200;
            color: #aaa;
            margin: 0;
        }

        .trending-list h4 {
            color: #888;
            margin: 0;
        }

        .trending-list a:hover h4 {
            color: #333;
        }

    .resource-basic-btn {
        display: inline-block;
        text-align: right;
        font-size: 13px;
        color: #888;
        text-decoration: none;
    }

        .resource-basic-btn:hover {
            color: #3498db;
        }

    .trending-title {
        font-weight: 200;
        text-align: center;
        padding: 0 30px;
        margin: 20px 0 0 0;
    }

    .trending-intro {
        font-weight: 200;
        padding: 20px 30px 0 30px;
        text-align: center;
        max-width: 480px;
        margin: 20px auto;
        color: #888;
        position: relative;
        line-height: 1.6em;
    }

        .trending-intro:after {
            width: 50px;
            position: absolute;
            top: -1px;
            left: 50%;
            margin-left: -25px;
            height: 3px;
            background: #3498db;
            content: "";
        }

        .trending-intro:before {
            width: 200px;
            position: absolute;
            top: 0;
            left: 50%;
            margin-left: -100px;
            height: 1px;
            background: #e5e5e5;
            content: "";
        }

    .add-resource-form {
        padding: 0 30px;
        max-width: 480px;
        margin: 20px auto;
    }

    div.box {
        float: left;
        width: 223px;
        padding: 5px;
        border: 2px solid #FAFAFA;
        margin: 2px;
        box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
    }

        div.box h3 {
            font-size: 24px;
            line-height: 26px;
            margin: 0;
        }

    .box1 {
        padding: 10px 20px;
        display: inline-block;
        border: 1px solid #E5E5E5;
        text-decoration: none;
        border-radius: 4px;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
        width: 100%;
    }

    .box2 {
        padding: 10px 20px;
        display: inline-block;
        border: 1px solid #E5E5E5;
        text-decoration: none;
        border-radius: 4px;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
        width: 100%;
    }

    .errormesssage {
        color: red;
        font-style: italic;
        font-size: 13px;
    }

    .reviews {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .review .rating {
        float: right;
    }
    .rating.inactive, .rating.inactive li {
        cursor: default;
    }
    .rating{list-style:none;color:#aaa;overflow:hidden;padding:0;margin:0;cursor:pointer}
    .rating li{display:inline-block;padding:3px 0;cursor:pointer}
    .rating .hovered,.rating .selected{color:#e2b500}
    .rating.inactive,.rating.inactive li{cursor:default}
</style>

<script src='/desktopmodules/blackhouse/js/vendor/jquery.js' type="text/javascript"></script>
<script src='/desktopmodules/blackhouse/js/vendor/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='/desktopmodules/blackhouse/js/vendor/jquery.rating.js' type="text/javascript" language="javascript"></script>
<link href='/desktopmodules/blackhouse/js/vendor/jquery.rating.css' type="text/css" rel="stylesheet"/>

<asp:HiddenField runat="server" ID="hidResourceId" />
<h3>
    <asp:Label runat="server" ID="lblResourceName" Style="width: 90%" CssClass="resources-label" />
    <span runat="server" id="spanRating" style="float: right" class="resources-label">

    </span>
    <span runat="server" id="spanNotRated" style="float: right" class="resources-label">
        This resource has not recieved enough ratings.<br />
    </span>
    <span runat="server" id="spanRateResource" style="float: right" class="resources-label" visible="false">
        <asp:RadioButton runat="server" ID="rdoRating1" GroupName="resourceRating" Text="Poor (1 star)" /><br />
        <asp:RadioButton runat="server" ID="rdoRating2" GroupName="resourceRating" Text="Below Average (2 star)" /><br />
        <asp:RadioButton runat="server" ID="rdoRating3" GroupName="resourceRating" Text="Average (3 star)" /><br />
        <asp:RadioButton runat="server" ID="rdoRating4" GroupName="resourceRating" Text="Good (4 star)" /><br />
        <asp:RadioButton runat="server" ID="rdoRating5" GroupName="resourceRating" Text="Great (5 star)" Checked="true" /><br />
        <asp:LinkButton runat="server" ID="btnRate" Text="Save" OnClick="btnRate_Click" />
    </span>
</h3>
    <span runat="server" id="spanRate" style="float: right; clear:both;" class="resources-label" visible="false">
        <asp:LinkButton runat="server" ID="lnkRate" Text="Click here to rate this resource." OnClick="lnkRate_Click" />
    </span>    

<table style="display: block; min-height: 200px; vertical-align: top; height: auto; width: 100%;">
    <tr>
        <td>
            <img runat="server" id="imgPreviewImage" style="float: left;" width="204" height="350" /></td>
        <td style="vertical-align:top; padding: 10px; width:90%;">
            <asp:Label runat="server" ID="lblResourceDescription" CssClass="resource-label" /></td>
    </tr>
</table>
<span><b>
    <asp:Label runat="server" Text="Resource Format: " CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourceType" CssClass="resources-label" /></span><br />
    <span runat="server" id="spanPhase"><b>
    <asp:Label ID="lblPhase" runat="server" Text="Phase:" CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourcePhase" CssClass="resources-label" /></span><br />
    <span runat="server" id="spanSubject"><b>
    <asp:Label ID="lblSubject" runat="server" Text="Subject:" CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourceSubject" CssClass="resources-label" /><br />
</span>
<span runat="server" id="spanTopic"><b>
    <asp:Label ID="lblTopic" runat="server" Text="Topic:" CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourceTopic" CssClass="resources-label" /><br />
</span>
<span><b>
    <asp:Label runat="server" Text="Language:" CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourceLanguage" CssClass="resources-label" /></span><br />
<span><b>
    <asp:Label runat="server" Text="Format:" CssClass="resources-label" /></b>
    <asp:Label runat="server" ID="ResourceFormat" CssClass="resources-label" /></span><br />
<b>
    <asp:Label runat="server" Text="Uploaded:" CssClass="resources-label" /></b>
<asp:Label runat="server" ID="ResourceUploadDate" CssClass="resources-label" />
<p>
    <asp:Label runat="server" ID="lblFiles" CssClass="resources-label" />
</p>
<p>
    <asp:LinkButton runat="server" ID="lnkDownload" Text=".zip (all the files)" CssClass="text" OnClick="lnkDownload_Click" />
</p>

<asp:Repeater runat="server" ID="rptFiles" OnItemCommand="rptFiles_ItemCommand">
    <ItemTemplate>
        <div class="box">
            <span><b>
                <asp:Label runat="server" Text="File Name: " CssClass="resources-label" /></b><asp:Label runat="server" ID="lblFileName" Text='<%#Eval("FileName") %>' CssClass="resources-label" /></span><br />
            <span><b>
                <asp:Label runat="server" Text="File Size: " CssClass="resources-label" /></b><asp:Label runat="server" ID="lblFileSize" Text='<%#Eval("FileSize").ToString() + "kb" %>' CssClass="resources-label" /></span><br />
            <span><b>
                <asp:Label runat="server" Text="File Content Type: " CssClass="resources-label" /></b><asp:Label runat="server" ID="lblFileContentType" Text='<%#Eval("FileContentType") %>' CssClass="resources-label" /></span><br />
            <span style="line-height: 44px; text-align: center;">
                <asp:LinkButton runat="server" ID="lnkDownload" Text="Download" CommandArgument='<%#Eval("FileId") %>' CssClass="text" /></span>
        </div>
    </ItemTemplate>
</asp:Repeater>

<p>
    <asp:Label runat="server" ID="lblWebsiteLinks" CssClass="resources-label" />
</p>
<asp:Repeater runat="server" ID="rptWebsites">
    <ItemTemplate>
        <span><b>Go See: </b>
            <asp:HyperLink runat="server" ID="lblFileName" Text='<%#Eval("resourceURL") %>' NavigateUrl='<%#Eval("resourceURL") %>' /></span><br />
    </ItemTemplate>
</asp:Repeater>
<br />
<div style="clear:both;" />
<div id="divApproval" runat="server">
<div id="divAdmin" style="margin: 5px; border: 1px solid #fff; padding: 5px;">
        <asp:CheckBox runat="server" ID="chkApprove" Text="Approved" Checked="true" /><br />
        <div>
            <asp:LinkButton runat="server" ID="cmdApprove" Text="Confirm Approval" OnClick="cmdApprove_Click" CssClass="resource-btn resource-basic-btn" />
            <asp:LinkButton runat="server" ID="cmdDelete" Text="Delete Resource" CssClass="resource-btn resource-basic-btn" OnClick="cmdDelete_Click"  />
        </div>
    </div>
</div>
<hr />
<div> 
    <h3>Resource Comments</h3>

    </div>
    <div id="divCommentsList">
        <asp:Repeater runat="server" ID="rptComments" >
            <ItemTemplate>
                <div style="width:100%; padding:10px; clear:both;">
                    <asp:Label runat="server" ID="lblComment" Text='<%#Eval("comment") %>' /><br />
                    <span style="width:100%; text-align:right; float:right; padding: 4px; font-size: 10px;"><asp:Label runat="server" ID="lblCommentDate" Text='<%#Eval("commentDate") %>' /></span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="divEmptyMessage" runat="server">
        <div class="text">There are currently no Comments.</div>
        <div style="clear:both" />
        <div id="divAddFirstComment" runat="server">
            You can <asp:LinkButton runat="server" ID="cmdAddNewComment" Text="Add a Comment" OnClick="cmdAddNewComment_Click" /> &nbsp;now!
        </div>
        <div style="clear:both" />
    </div>
        <div id="divAddaComment" runat="server" visible="false">
            <asp:LinkButton runat="server" ID="cmdAddComment" Text="Add a Comment" OnClick="cmdAddNewComment_Click" />
        </div>    <div id="AddComment" runat="server" visible="false">
        <asp:HiddenField runat="server" ID="hidCommentId" Value="" />
        <div>
            <asp:Label runat="server" ID="lblComment" Text="Comment:" />
            <asp:TextBox runat="server" Rows="5" TextMode="MultiLine" ID="txtComment" CssClass="text textarea" />
        </div>
        <div>
            <asp:LinkButton runat="server" ID="cmdCancelComment" Text="Cancel" OnClick="cmdCancelComment_Click" />
            &nbsp;
                    <asp:LinkButton runat="server" ID="cmdSaveComment" Text="Save" OnClick="cmdSaveComment_Click" />
        </div>
    </div>

