Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940877;
	b=h02NlRkcm+NGG/ax0I6svwMe3sbqEfkyfcqOf4jWBi36dENeM5h2DWcHyqPAstQeHq4x
	 Hd/fU58DijoEfTIZXfI0Vb3L0SfaXynakgkIfzQX0ZeYAQ/GYGOESaGTF37KatVKGsQSk
	 OD1Z3RyMYveW7rGfTBTm+fsVVq1v6yqMu/nSkwff9PiO0B1udPo5YBaoT5YKRyUwS5Ioh
	 WgxmCSxt7FdyV/KzNeuy8h9/plk6YMbi58+YRuJeKzph+sjUyGPAufCJIcwjqds8TMd8H
	 8vB5YIyc3GpF4ro/7oRrFEWZj1JG3HVKHAHUeNM9ak42yUwIErYVVafPqz2QWM+iIHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940877;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=LDJB/RrDCKz2A3Qo6DSgJC9SdTBHa5bbzitp9NuIwhc=;
	b=PzYCeDh0tQlUKn+FOSxIGMBu6lAJ+CqCY92IqUiO9XF7jnyi8k7qRJkPrZN68Dc9D08N
	 6N45ecOTRAb/Axt2az1ceeHNdWVdCgCL54ZJbQgKXZcie6s77V6iD5VyBtyWRVsm0RYZm
	 fduKHMqtMuNhH14BxbUsf91kkmFVwdQLjc43gZZRg8pfsCbnzFls1igs/DQk9RhFZMvpj
	 253IsSfUO+CXUo2OKC+lo6258BVeaLzEqKpIyIlkdcVt2nJXS8x9Okl33bi2vcbMiXc1s
	 9W6vk+UuxeG2AXP9sUr/Vy4Z8S/Jay6nORDVf+GlHtIDlA/YaHwp+/hbkavP2cu93Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 302D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ea2c058e67so26680b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940876; x=1795545676;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LDJB/RrDCKz2A3Qo6DSgJC9SdTBHa5bbzitp9NuIwhc=;
        b=TIrRTD3oxuc/aeaxpMzHGqMtb7KaVxxCjr4x+e3Gul3f5mEdKD16cOBfRCH8kumFBi
         rPxAl0xYCOHkbmelneSiACSzYXWJPcGPcpD/81GKxck0vP4MULhGwKAWz8KXGCMwE2xZ
         sYNYHzw/egDE5xZ37ZjDxg7c1jglJJ4EIDzqra9CnFZea/nIfMuRwmsnpOJCTKICiVbp
         j3SYmbCAVlReTHcyQj/9hqsGS1YKr0RoaEMzD42fKycUKN9ZGuL1HYg8F3TOTl0A6FlQ
         LyjVDrB5wQZ6C16KSDXCVAEeLxnA7Yl2KYcMmoBlr1thMA5ttTWxSD0tACfMpAMFHzat
         oKDQ==
X-Forwarded-Encrypted: i=1; AL+hErFvKlcRdZA2tr3GfmXBVh7NdqyMiwwBqukql8/iq2xi5d2w42Jreu9674EM2v0B6Y4oZ10HnghULq7oo0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Cr3uUyGQVlIIDweeJKmDvnd6GjSTxOVksdFzGXhv1m5JuKju
	lMrm4++UvEHkhoMZpZQVdWA+HODRrrYfZAv0OLsSwk74kiuNavyMs7nILwr6vK7Drmi/dkI33g3
	rOzO2jNuIoEyBhwPA5E7FIySKPpA52yoK58IY5sYfXWTLFejldtVtitqxE78=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1991:b0:4c3:bc6a:a328 with SMTP id
 5614622812f47-5773d8360demr757544b6e.31.1794940876203; Tue, 17 Nov 2026
 10:41:16 -0800 (PST)
Date: Tue, 17 Nov 2026 10:41:16 -0800
In-Reply-To: <20261117184104.580959-1-timo.joannin@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afc9fcc.6a9a30c8.1f5211.000c.GAE@google.com>
Subject: Re: [PATCH] usb: gadget: uvc: fix lockdep deadlock in configfs attributes
From: syzbot <syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com>
To: timo.joannin@gmail.com
Cc: timo.joannin@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> Patch to resolve the lockdep warning in uvc_configfs.
>
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 48 ++++++++++++++--------
>  drivers/usb/gadget/function/uvc_configfs.h |  6 +++
>  2 files changed, 38 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 70a1415ea401..0be29022161a 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -269,11 +269,16 @@ static struct config_item *uvcg_control_header_make(struct config_group *group,
>  						    const char *name)
>  {
>  	struct uvcg_control_header *h;
> +	struct f_uvc_opts *opts;
>  
>  	h = kzalloc_obj(*h);
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
> +	// find opts once
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->desc.bLength			= UVC_DT_HEADER_SIZE(1);
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
>  	h->desc.bDescriptorSubType	= UVC_VC_HEADER;
> @@ -1007,19 +1012,11 @@ UVC_ATTR(uvcg_extension_, guid_extension_code, guidExtensionCode);
>  static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
>  						char *page)
>  {
> -	struct config_group *group = to_config_group(item->ci_parent);
> -	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
>  	struct uvcg_extension *xu = to_uvcg_extension(item);
> -	struct config_item *opts_item;
> -	struct f_uvc_opts *opts;
> +	struct f_uvc_opts *opts = xu->opts;
>  	char *pg = page;
>  	int ret, i;
>  
> -	mutex_lock(su_mutex);
> -
> -	opts_item = item->ci_parent->ci_parent->ci_parent;
> -	opts = to_f_uvc_opts(opts_item);
> -
>  	mutex_lock(&opts->lock);
>  	for (ret = 0, i = 0; i < xu->desc.bNrInPins; ++i) {
>  		ret += sprintf(pg, "%u\n", xu->desc.baSourceID[i]);
> @@ -1027,8 +1024,6 @@ static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
>  	}
>  	mutex_unlock(&opts->lock);
>  
> -	mutex_unlock(su_mutex);
> -
>  	return ret;
>  }
>  
> @@ -1270,13 +1265,14 @@ static struct config_item *uvcg_extension_make(struct config_group *group, const
>  	struct uvcg_extension *xu;
>  	struct f_uvc_opts *opts;
>  
> -	opts_item = group->cg_item.ci_parent->ci_parent;
> -	opts = to_f_uvc_opts(opts_item);
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
>  
>  	xu = kzalloc_obj(*xu);
>  	if (!xu)
>  		return ERR_PTR(-ENOMEM);
>  
> +	xu->opts = opts;
> +
>  	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(0, 0);
>  	xu->desc.bDescriptorType = USB_DT_CS_INTERFACE;
>  	xu->desc.bDescriptorSubType = UVC_VC_EXTENSION_UNIT;
> @@ -1898,12 +1894,17 @@ static struct config_item
>  *uvcg_streaming_header_make(struct config_group *group, const char *name)
>  {
>  	struct uvcg_streaming_header *h;
> +	struct f_uvc_opts *opts;
>  
>  	h = kzalloc_obj(*h);
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
>  	INIT_LIST_HEAD(&h->formats);
> +
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
>  	h->desc.bDescriptorSubType	= UVC_VS_INPUT_HEADER;
>  	h->desc.bTerminalLink		= 3;
> @@ -2167,6 +2168,9 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->frame.b_descriptor_type		= USB_DT_CS_INTERFACE;
>  	h->frame.b_frame_index			= 1;
>  	h->frame.w_width			= 640;
> @@ -2177,9 +2181,6 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
>  	h->frame.dw_default_frame_interval	= 666666;
>  	h->frame.dw_bytes_perline		= 0;
>  
> -	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
> -	opts = to_f_uvc_opts(opts_item);
> -
>  	mutex_lock(&opts->lock);
>  	fmt = to_uvcg_format(&group->cg_item);
>  	if (fmt->type == UVCG_UNCOMPRESSED) {
> @@ -2477,6 +2478,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
>  	struct uvcg_color_matching *color_match;
>  	struct config_item *streaming;
>  	struct uvcg_uncompressed *h;
> +	struct f_uvc_opts *opts;
>  
>  	streaming = group->cg_item.ci_parent;
>  	color_match = uvcg_format_get_default_color_match(streaming);
> @@ -2487,6 +2489,9 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->desc.bLength			= UVC_DT_FORMAT_UNCOMPRESSED_SIZE;
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
>  	h->desc.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED;
> @@ -2669,6 +2674,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
>  	struct uvcg_color_matching *color_match;
>  	struct config_item *streaming;
>  	struct uvcg_mjpeg *h;
> +	struct f_uvc_opts *opts;
>  
>  	streaming = group->cg_item.ci_parent;
>  	color_match = uvcg_format_get_default_color_match(streaming);
> @@ -2679,6 +2685,9 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->desc.bLength			= UVC_DT_FORMAT_MJPEG_SIZE;
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
>  	h->desc.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG;
> @@ -2930,6 +2939,9 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
>  
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	h->opts = opts;
> +
>  	h->desc.bLength                 = UVC_DT_FORMAT_FRAMEBASED_SIZE;
>  	h->desc.bDescriptorType         = USB_DT_CS_INTERFACE;
>  	h->desc.bDescriptorSubType      = UVC_VS_FORMAT_FRAME_BASED;
> @@ -3074,11 +3086,15 @@ static struct config_group *uvcg_color_matching_make(struct config_group *group,
>  						     const char *name)
>  {
>  	struct uvcg_color_matching *color_match;
> +	struct f_uvc_opts *opts;
>  
>  	color_match = kzalloc_obj(*color_match);
>  	if (!color_match)
>  		return ERR_PTR(-ENOMEM);
>  
> +	opts = to_f_uvc_opts(group->cg_item.ci_parent->ci_parent);
> +	color_match->opts = opts;
> +
>  	color_match->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
>  	color_match->desc.bDescriptorType = USB_DT_CS_INTERFACE;
>  	color_match->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index 9391614135e9..132a11ef57f3 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -30,6 +30,7 @@ struct uvcg_control_header {
>  	struct config_item		item;
>  	struct UVC_HEADER_DESCRIPTOR(1)	desc;
>  	unsigned			linked;
> +	struct f_uvc_opts		*opts; /* pointer to top level f_uvc_opts struct */
>  };
>  
>  static inline struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
> @@ -41,6 +42,7 @@ struct uvcg_color_matching {
>  	struct config_group group;
>  	struct uvc_color_matching_descriptor desc;
>  	unsigned int refcnt;
> +	struct f_uvc_opts *opts;
>  };
>  
>  #define to_uvcg_color_matching(group_ptr) \
> @@ -60,6 +62,7 @@ struct uvcg_format {
>  	unsigned			num_frames;
>  	__u8				bmaControls[UVCG_STREAMING_CONTROL_SIZE];
>  	struct uvcg_color_matching	*color_matching;
> +	struct f_uvc_opts		*opts;
>  };
>  
>  struct uvcg_format_ptr {
> @@ -77,6 +80,7 @@ struct uvcg_streaming_header {
>  	unsigned					linked;
>  	struct list_head				formats;
>  	unsigned					num_fmt;
> +	struct f_uvc_opts				*opts;
>  
>  	/* Must be last --ends in a flexible-array member. */
>  	struct uvc_input_header_descriptor		desc;
> @@ -95,6 +99,7 @@ struct uvcg_frame_ptr {
>  struct uvcg_frame {
>  	struct config_item	item;
>  	enum uvcg_format_type	fmt_type;
> +	struct f_uvc_opts	*opts;
>  	struct {
>  		u8	b_length;
>  		u8	b_descriptor_type;
> @@ -182,6 +187,7 @@ struct uvcg_extension {
>  	struct config_item item;
>  	struct list_head list;
>  	u8 string_descriptor_index;
> +	struct f_uvc_opts *opts;
>  	struct uvcg_extension_unit_descriptor desc;
>  };
>  
> -- 
> 2.56.1
>
