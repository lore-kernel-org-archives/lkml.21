Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679263;
	b=B/VkunHGlzsh8Yb6fObZJTNcShebIgnuUHgSJU+60eCq6AKTLcbbbqM+QgQgZV1K/QYV
	 htrYH9kP+7iWO+VakS8f4E/zi1yZwOQhJA3Dpc8RQG8LEeg+QBYrjJsrTfgEdgEksNWy9
	 qdJi6bNATh+KpVAi5LYVMugVaf9v4eInjeHHC5N0kItmzvP837loN1QuP5VmbZFPwMvMQ
	 AF8vnXk4uYs4s73GhmO0YGIBWt4GuYJt67cx0oLwuzmlLXeT8ZIazTZDqPNNwA/PclPtF
	 5oHkvGlmyJkS9gCVWUYDKzMW0+N99wDJRDb1s7wJ+VIT9LT7KZPG/Ktrqvx3xlwZQ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679263;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=jISRNbG/v32H4q80Inpp/FrKPmg/Fs/21OgyTNqlNxI=;
	b=YV+4vJEHhOJ2QTB1dT/rXWUuirOyN38at9u/F69zXNJwIHLYQ+9K7dBAGftP47w55eCv
	 kGrAe5CExZwFFfq73WPNC2Nscanf2XBRVBE6te7RoItsa4EY+gLfDvEzuEb7XVdpf4V3e
	 8U61FCrngkAWqNwvIHSxw8USWk/K0FPOHZeiyPQzJOBmefN/478TKELmZQxmMVgCJHeIb
	 PL9CnGE2KpAF6plpgP+5ODqemcw2nWRzzuLCfrZuRwA+tLyKjGTdHu39YnFAKnQgvGrOX
	 ppxSBoRzNXRlA77n5tPA+9TlWksYK5yT378fPg1C63QAf7/x3INQnfZOkiJbi5CjTCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NkUyBYLF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9XMfLHUr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KJSFcApl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wXbWiT8R;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD694606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD694606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NkUyBYLF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9XMfLHUr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KJSFcApl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wXbWiT8R
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 271FD2261D;
	Thu, 26 Nov 2026 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795679260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jISRNbG/v32H4q80Inpp/FrKPmg/Fs/21OgyTNqlNxI=;
	b=NkUyBYLFZakKACVBWdCzOEcVRu7mFg6KzgQ6858SUXPNPkmvR9IFc0b8k8uv1qO40Os4sQ
	o/1hEEqSv+ygzFOmSJnK6eFHl7ljYpVBGLmEwwC1rzhYDMQuGyYc0zvWEboMa/vfmLMhrc
	iADfZi+c/iVfuywjVoO3IGiqi90ByRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795679260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jISRNbG/v32H4q80Inpp/FrKPmg/Fs/21OgyTNqlNxI=;
	b=9XMfLHUrAoSfqvswXoUiNW2zdomzrmN26SxfNCv+1cdK350S9X486lIdO713rCGotOj2qF
	x1NH33OROI9EPIAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KJSFcApl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wXbWiT8R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795679258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jISRNbG/v32H4q80Inpp/FrKPmg/Fs/21OgyTNqlNxI=;
	b=KJSFcAplhQdliNWK+YoI6vS/LXMN+RNJx2jFQOeKTNtNP/QDWEOELzGHajsSXuzI+Fedlv
	gL68vZPPbPEEoquek00BpMgN+FcUCM2cvEsZY2vVuYoBIlXHHHTKeLIbMtCdcHKQF6flwj
	HdKjkhmwrmThIwW0Zz+VIHhezKV4/Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795679258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jISRNbG/v32H4q80Inpp/FrKPmg/Fs/21OgyTNqlNxI=;
	b=wXbWiT8Re5565SXcNeohV6F8xUM5P80UNbMEhqV3ecAyWuIS5FjYKeIR9cBtpCP4RgXfQM
	bjAuJs4GlMh/y5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C24DE134C3;
	Thu, 26 Nov 2026 07:47:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0hCXGBnkB2syfAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 26 Nov 2026 07:47:37 +0000
Message-ID: <b5f237cf-582a-42f5-8ebc-c006ccecf62f@suse.de>
Date: Thu, 26 Nov 2026 08:47:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/log: Add an automatic integer scaling
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261124224408.728354-1-jfalempe@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20261124224408.728354-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 271FD2261D
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:dkim]
X-Spam-Score: -13.50

Hi Jocelyn

Am 24.11.26 um 23:42 schrieb Jocelyn Falempe:
> On HiDPI screen, the default font might be too small, so if no
> scaling is specified, try to upscale reasonably.
> The auto scaling is computed for each display.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 36 ++++++++++++++++++++-----------
>   1 file changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 4654091fe11a..7a0db2690b55 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -25,9 +25,9 @@ MODULE_AUTHOR("Jocelyn Falempe");
>   MODULE_DESCRIPTION("DRM boot logger");
>   MODULE_LICENSE("GPL");
>   
> -static unsigned int scale = 1;
> +static unsigned int scale = 0;
>   module_param(scale, uint, 0444);
> -MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 1");
> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 0 (auto)");
>   
>   /**
>    * DOC: overview
> @@ -42,6 +42,7 @@ struct drm_log_scanout {
>   	const struct font_desc *font;
>   	u32 rows;
>   	u32 columns;
> +	u32 scale;
>   	u32 scaled_font_h;
>   	u32 scaled_font_w;
>   	u32 line;
> @@ -72,17 +73,17 @@ static struct drm_log *console_to_drm_log(struct console *con)
>   
>   static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>   			 const u8 *src, unsigned int src_pitch,
> -			 u32 height, u32 width, u32 px_width, u32 color)
> +			 u32 height, u32 width, u32 blit_scale, u32 px_width, u32 color)
>   {
>   	switch (px_width) {
>   	case 2:
> -		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, scale, color);
> +		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
>   		break;
>   	case 3:
> -		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, scale, color);
> +		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
>   		break;
>   	case 4:
> -		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, scale, color);
> +		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
>   		break;
>   	default:
>   		WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
> @@ -122,7 +123,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>   		if (src)
>   			drm_log_blit(&map, fb->pitches[0], src, font_pitch,
>   				     scanout->scaled_font_h, scanout->scaled_font_w,
> -				     px_width, color);
> +				     scanout->scale, px_width, color);
>   		iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>   	}
>   
> @@ -206,6 +207,15 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
>   	return DRM_FORMAT_INVALID;
>   }
>   
> +/* Find the biggest integer scaling to get about 120x50 chars on the screen */

Something like 80x30 (VGA mode 0x17) or 80x50 (VGA mode 0x102) seems 
natural. But what is the reason for 120x50?

Best regards
Thomas

> +static int auto_scale(unsigned int cols, unsigned int rows)
> +{
> +	unsigned int scale_w = DIV_ROUND_CLOSEST(cols, 120);
> +	unsigned int scale_h = DIV_ROUND_CLOSEST(rows, 50);
> +
> +	return max(min(scale_w, scale_h), 1);
> +}
> +
>   static int drm_log_setup_modeset(struct drm_client_dev *client,
>   				 struct drm_mode_set *mode_set,
>   				 struct drm_log_scanout *scanout)
> @@ -230,8 +240,13 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
>   		return -ENOMEM;
>   	}
>   	mode_set->fb = scanout->buffer->fb;
> -	scanout->scaled_font_h = scanout->font->height * scale;
> -	scanout->scaled_font_w = scanout->font->width * scale;
> +	if (scale)
> +		scanout->scale = scale;
> +	else
> +		scanout->scale = auto_scale(width / scanout->font->width,
> +			                    height / scanout->font->height);
> +	scanout->scaled_font_h = scanout->font->height * scanout->scale;
> +	scanout->scaled_font_w = scanout->font->width * scanout->scale;
>   	scanout->rows = height / scanout->scaled_font_h;
>   	scanout->columns = width / scanout->scaled_font_w;
>   	if (!scanout->rows || !scanout->columns) {
> @@ -444,9 +459,6 @@ void drm_log_register(struct drm_device *dev)
>   {
>   	struct drm_log *new;
>   
> -	if (!scale)
> -		scale = 1;
> -
>   	new = kzalloc_obj(*new);
>   	if (!new)
>   		goto err_warn;
>
> base-commit: bcf5c42d6ed136cc407cea896f131d6893c830af

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


