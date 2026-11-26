Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707965;
	b=cPzXIrI7kDvetZVAQo43Pd1PtwlhF18YRmZ0fd0gctrDkstUCZP0bVRsWJxKQbcCSK5x
	 niapFsT0rNnqrg+EEPe4PB1qU5tzlU/736oPSxLGD0WyRuTYMuZdRKPsdH5+313gJBLQn
	 zVU9zfrzaY0pTJHao0MhWrlqTV59YNFKMADc3eZOErulf0C0O7nD6zPKeCRmIjKgnzSaa
	 auFHAipMeS29aRNq25RAY/m3oFZhX325FfqfFjR4+07Y0CkYkprs3bh4sRrQMieAQziP6
	 1ISdJTQzpelhd1ZOOiaaAPMdCWHUyvtwmfpb7PtLrF6Y/9tsWOPel19dmpFj7/L82GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707965;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CcIgPekR3mPxUG7ybhHN4QGjZuhudN2DV2cTFafDK9g=;
	b=5Tavxtcrm5oyS8tq9NcX7jld9iNroI3aakqSAAEpFqzZDKySFb9jApyAJmSXisa7OZ2o
	 93ZjNKUxlyort2HWAEkzWjdEPqAars+TeA2CyUFotDW/tKHuPOZNUrhrzzMrTxOIuLS2n
	 OZP2QoRlCnobJ5OpcOW8Qbg9JTKxkC2iXD+CSlsTvkjs7y1CxV0wGeE45LCxbaAzVBG1+
	 2R4/q2nh03WQKT+EvKE19LFtTB+lQhcXLgxrBRcsESQufgzLKEt3d5Rh4oohd/nrhnhnn
	 Y0CSglcAyHGkd90GgHH2j401/RY241wp7FZ+qMVfSN9yEyABwBeseBTMgUtA6ASYsmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnrzJIGr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZuRHO5z3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF15606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF15606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnrzJIGr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZuRHO5z3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795707963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcIgPekR3mPxUG7ybhHN4QGjZuhudN2DV2cTFafDK9g=;
	b=SnrzJIGrTNMsLJZ/vOYyfLeClNG7sKWXBqlROBms5wQl/fQuB2VSiVlUUE+Cf+zbz5CaX8
	5rYYY8jaX3QiVAoZTriDCBJo29+uz758Vwk+1zUo40L+N0axz3VRb9WatlHuA/uOw4Juh0
	hCa83RE1l7+3cLeOIBB8OhSKw+uaLg0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-YXC1ivMbPzC6qCjZqIX2Jg-1; Thu, 26 Nov 2026 15:46:01 +0000
X-MC-Unique: YXC1ivMbPzC6qCjZqIX2Jg-1
X-Mimecast-MFC-AGG-ID: YXC1ivMbPzC6qCjZqIX2Jg_1795707960
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4aa0500c979so4301402f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795707960; x=1796312760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CcIgPekR3mPxUG7ybhHN4QGjZuhudN2DV2cTFafDK9g=;
        b=ZuRHO5z3gfPKGqFUANkEae0oELPOMm6BoqxBpYQGJdnvdRFl1ID4t0I0vaBJ6vaDsC
         dvnbkm5A/4EMB+3t+I9NlGND8fEUCUCVuVbdxjwzmKvvNBJf3AOnHx0usSIxHCtQa2L1
         2SPxMlUWURyab+dLy2Wt9OYQvpXSx9jJdLCaL4djZ8TmGviXw5DX3+T/gV3ncqJ4jiwm
         n+HUV05evIFU8cB0UNqgCuR7suMSA+mFwwLcyktIedMJTEyv6koVmqP04kGcFv+JbzPf
         Yr+XS1Wuc9L0TOlTVIEBkdXbJp1vneQu3IUnT6sKQS0hMjWHZxpwUdtynVRn3OzeVbAX
         Ce/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707960; x=1796312760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcIgPekR3mPxUG7ybhHN4QGjZuhudN2DV2cTFafDK9g=;
        b=CR9zWudPqpwgVQUlEXwkx2UERbAn/nMPfRT7BzXOuLQq38TpmtKph1sWFTXf3RXP1u
         sf7V64ueICIHlqJtc6NscqyJmvXVE3PoZne6lEhMiQc9IeBZ21Kva96dvIGZIx4R4Li2
         C3BDgc6aHCV4lyb/jRS+CLiR8gfjhMN3Dmyq19D19nJGPcWkhR3l/ifPf14xBbpPtd9R
         Wne4A6ARFWqNsQ23/1Pr5Vo71rQ1G1fnKqO2bYMmonHAM1IULFwlwvWW2E8TrDsbA4nT
         Sc2Om94OsdxEN/0oS/GsNbr99jRLUQlm3M4An87BKHQzxTuig5/gd/WT/tZUPv3h+Q9T
         yxCg==
X-Forwarded-Encrypted: i=1; AL+hErGyEhRnQqZQF0IWadKKpOHzb9bkOG2jLekVAvSJ4FRkRqYxLkpefJXjeXxWx1wjhf/fp8PQVf1tROOsq7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nwC0n+c5UCzH7YEDZw1PvrLi7BPZO3zXDBMA+pDsVmT05hkct
	a1xSFpb/w5CDD3k5noVAB7Oe5R8ZQs4qJQIHX/ILpKYQA5gT6bv5uInFLLM2ACSUuurDIFKek5y
	9Z4Vgzzlxs4oh9ppq0x2rR9Aa2VnSf/xhUBFbiEcwQ4a8BdGZ8B99YJtswizL8w2mGw==
X-Gm-Gg: AZFdTZfSYBOrkKodpNGcXEjOkKT7Egtq8gR4608ATrY2E+5I9qK0iKcXHGG2lT+Dw5u
	4WWqldME+h57Ek4p5U/RYz0bQJLaJWkNAGmqsKSUb1D2QjhiKaPQGmUYgo+/zekisflLqOngjnh
	xNVeN/kEwsBidoFL3Nog1JHwi9WW2W1H8aLfSFONepd0CU7i/qz3mhA5Wi9YPgUIVNpim43RolR
	Hemfhbj/dZ1rAsSDs+KSoZQ6+M4H4e0Kdavpj8E1ifB4qgQlkYUt8pF9s2bbXZnXiGlltfuK+lh
	9fTUYlWwzKDorNPOe2R4790Z36V6hJrFCujjTrcVF4UmzPuQrFJ5hVtTZx3mcAoIwJ6XCP/pNuE
	X0LAAEavdrzPqW5oXmpNLg/c5wm37zF+5sWET43LRDPoqa+VAyTv/MxIbaOWPtxcIACYRbibSye
	d+S5PACvTlw90jPhR0mkpO
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr445865925e9.16.1795707960238;
        Thu, 26 Nov 2026 07:46:00 -0800 (PST)
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr445865525e9.16.1795707959785;
        Thu, 26 Nov 2026 07:45:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm137969695e9.3.2026.11.26.07.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:45:59 -0800 (PST)
Message-ID: <413a4dbc-cd7a-4a0c-ab98-da569f7a5484@redhat.com>
Date: Thu, 26 Nov 2026 16:45:56 +0100
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
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261124224408.728354-1-jfalempe@redhat.com>
 <b5f237cf-582a-42f5-8ebc-c006ccecf62f@suse.de>
 <fe5485e4-c3fc-4f18-86b2-d37106876c47@redhat.com>
 <e9d6ae3e-585b-4240-8f07-8c06911d83cd@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <e9d6ae3e-585b-4240-8f07-8c06911d83cd@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/26 10:54, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.11.26 um 10:02 schrieb Jocelyn Falempe:
>> On 11/26/26 08:47, Thomas Zimmermann wrote:
>>> Hi Jocelyn
>>>
>>> Am 24.11.26 um 23:42 schrieb Jocelyn Falempe:
>>>> On HiDPI screen, the default font might be too small, so if no
>>>> scaling is specified, try to upscale reasonably.
>>>> The auto scaling is computed for each display.
>>>>
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>   drivers/gpu/drm/clients/drm_log.c | 36 +++++++++++++++++++ 
>>>> +-----------
>>>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/ 
>>>> clients/drm_log.c
>>>> index 4654091fe11a..7a0db2690b55 100644
>>>> --- a/drivers/gpu/drm/clients/drm_log.c
>>>> +++ b/drivers/gpu/drm/clients/drm_log.c
>>>> @@ -25,9 +25,9 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>>>   MODULE_DESCRIPTION("DRM boot logger");
>>>>   MODULE_LICENSE("GPL");
>>>> -static unsigned int scale = 1;
>>>> +static unsigned int scale = 0;
>>>>   module_param(scale, uint, 0444);
>>>> -MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, 
>>>> default is 1");
>>>> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, 
>>>> default is 0 (auto)");
>>>>   /**
>>>>    * DOC: overview
>>>> @@ -42,6 +42,7 @@ struct drm_log_scanout {
>>>>       const struct font_desc *font;
>>>>       u32 rows;
>>>>       u32 columns;
>>>> +    u32 scale;
>>>>       u32 scaled_font_h;
>>>>       u32 scaled_font_w;
>>>>       u32 line;
>>>> @@ -72,17 +73,17 @@ static struct drm_log *console_to_drm_log(struct 
>>>> console *con)
>>>>   static void drm_log_blit(struct iosys_map *dst, unsigned int 
>>>> dst_pitch,
>>>>                const u8 *src, unsigned int src_pitch,
>>>> -             u32 height, u32 width, u32 px_width, u32 color)
>>>> +             u32 height, u32 width, u32 blit_scale, u32 px_width, 
>>>> u32 color)
>>>>   {
>>>>       switch (px_width) {
>>>>       case 2:
>>>> -        drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, 
>>>> width, scale, color);
>>>> +        drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, 
>>>> width, blit_scale, color);
>>>>           break;
>>>>       case 3:
>>>> -        drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, 
>>>> width, scale, color);
>>>> +        drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, 
>>>> width, blit_scale, color);
>>>>           break;
>>>>       case 4:
>>>> -        drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, 
>>>> width, scale, color);
>>>> +        drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, 
>>>> width, blit_scale, color);
>>>>           break;
>>>>       default:
>>>>           WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
>>>> @@ -122,7 +123,7 @@ static void drm_log_draw_line(struct 
>>>> drm_log_scanout *scanout, const char *s,
>>>>           if (src)
>>>>               drm_log_blit(&map, fb->pitches[0], src, font_pitch,
>>>>                        scanout->scaled_font_h, scanout->scaled_font_w,
>>>> -                     px_width, color);
>>>> +                     scanout->scale, px_width, color);
>>>>           iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>>>>       }
>>>> @@ -206,6 +207,15 @@ static u32 drm_log_find_usable_format(struct 
>>>> drm_plane *plane)
>>>>       return DRM_FORMAT_INVALID;
>>>>   }
>>>> +/* Find the biggest integer scaling to get about 120x50 chars on 
>>>> the screen */
>>>
>>> Something like 80x30 (VGA mode 0x17) or 80x50 (VGA mode 0x102) seems 
>>> natural. But what is the reason for 120x50?
>>
>> I think this was a good default with old 15" CRT at 640x480. But for 
>> example for code line length, it's now configured in the 100-120 range 
>> in most codebase.
>> When looking at dmesg, a lot of lines are longer than 100, so 120 
>> allows to avoid too much line splitting.
>> For the number of rows, it's important to have some log history, so 50 
>> looks to be the sweet spot.
>> User can set a scaling manually, or build the kernel with bigger fonts 
>> if they don't like the default.
> 
> Some general thoughts on this:
> 
> Each font is designed for it's specific glyph resolution. Therefore, I 
> think it is a problem to scale x and y independent from each other. That 
> can mess up the font. I'd suggest to make the output aim for a certain 
> display height. Text runs from top to bottom and number of lines is 
> usually what people care for most. OTOH the display's right side is 
> usually empty.

Integer scaling is the same for x and y, otherwise I agree, the font 
would be distorted.

static int auto_scale(unsigned int cols, unsigned int rows)
{
	unsigned int scale_w = DIV_ROUND_CLOSEST(cols, 120);
	unsigned int scale_h = DIV_ROUND_CLOSEST(rows, 50);

	return max(min(scale_w, scale_h), 1);
}

This calculates the "optimal" scaling for width and height but then 
takes the min of both, and make sure it's 1 or more.

> 
> I agree that the original VGA mode 0x17 is a bit short one lines. The 50 
> lines you choose seem right to me. For the number of lines, I'd start 
> with the current font and scale if the number of lines becomes too 
> large. So that the resulting console has between 30 and 70 lines.

I think the minimum number of lines, is if you have 76 rows with 
scale=1, then autoscale will apply a scale of 2, ending up with 38 rows.
for larger number of rows, it will be closer to 50.

> For the number of columns, why not pick the preferred number of columns 
> in relation to the scaled font height and the display-mode resolution? 
> That keeps the font geometry at a correct ratio.
> 
> 
> I know all this is close to nitpicking and maybe the code does some of 
> this already. I just think it's important to make it look good on a 
> variety of displays.
> 
> 
>>
>> Currently, with 8x16 font (which is the most common), the default in 
>> full HD is 240x67. In 4K it's 480x135. So doing some integer scaling 
>> make the default experience much better.
> 
> Right, the current fonts are too small on modern displays.
> 
> Best regards
> Thomas
> 
>>
>> Best regards,
>>
> 

Thanks for the review.

Best regards,

-- 

Jocelyn


