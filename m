Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683763;
	b=Z+i24RE+y8T0LuYGLiM2ps3c1vQS4Fa3WDYr6rsShm8VL/dhrPRY0QRdgl08N/aPpt7f
	 QXR5iNtdZ8UZCY/vf9HzPCHJgTycpNCo4WOgp2hyHJv03MyVkgjKe6AZyPZRnpJJ9xBCh
	 q5y2pV+PH0EGkV47+jRdXnvh3Ia/qqP6pAyyTmUpTh0PX9a//I4KVuEXP9nFfyu5KB6YC
	 oIS1V/iGYhVuFO+TG509Ds1za9aB4c/wZqR0stt8Oj9CPaPHwxjrhYiFHAIeWx1nuSytS
	 lWSUdAomwqQTx5JuNZtlisA/h2AKGnqSzE5wBo+ERFf0+OMLrkrDBw0RSjOMuGkW2Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683763;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8p/oKY20OusxDDv41Q7c7EC8fbrlCimdqEtfaz8bn3Y=;
	b=xydEB6WEqROx7b5RgG+mIyN3w/+k11SFdHCartkU4WlF7dy/MJI6OI1vSdBc9ScGP+6q
	 xARiBvR+grqQyleqKFukZsGpCd46P+nVGk8xosKfvry+OZyMwFSpmEvpycKbRg2Pvve7q
	 KnK+DyvlH6/hTV3Wb52DgadcvKk06AWk6NsmyRP3jDdo5Js/PHqsAfLA7YnT/IBV/Hqv4
	 Tk08nqGqJYCVWMON6ZqyhZEPNAeeuFE1s0uNXxevuExdCekMnTUE8sH6yGB4S8rjrDt/M
	 v180dbmjtQY48Jwrh5AVPYgosYY8PQJsMtpwuGGvrpyqs3qt3FoMAqevpn+QgJVOnTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OTRwqwpY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=igIyvYPz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AFD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25AFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OTRwqwpY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=igIyvYPz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8p/oKY20OusxDDv41Q7c7EC8fbrlCimdqEtfaz8bn3Y=;
	b=OTRwqwpYUS/JpPCeEYXTzj9XbNBLshUW9b3cXSXGplpblw0KAqLpEjRiJ1HTwteIDouOBD
	an2p8SpzbI2nhc5ctxKuEIOsVbMvgrggxwUtqRuaFJxohNi7NTO3sbssqMmUyc+L53AcD3
	dv5KAIbkeYAjpl72dZcF2VT87tJBg+o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-Wsr2_-uoMveMUw7zGsu2qQ-1; Thu, 26 Nov 2026 09:02:39 +0000
X-MC-Unique: Wsr2_-uoMveMUw7zGsu2qQ-1
X-Mimecast-MFC-AGG-ID: Wsr2_-uoMveMUw7zGsu2qQ_1795683758
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so47431555e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795683758; x=1796288558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8p/oKY20OusxDDv41Q7c7EC8fbrlCimdqEtfaz8bn3Y=;
        b=igIyvYPzyjRQSEipicbzlgE1rdtJPqLk2OQsa8vMJ+VvvLHvD22rujfg9hjsXDLChl
         52v3ZZAv4GHDLEA4yFBkkuYMTCFVPxVbaSz08r48/4o6yn5GSWURXCj74c09bYwXnwnh
         1+bF4qwcGG4iGCRP+UPuvhW5p4dcVqs8w+1rcWu2pmWBvF96O/ue79xyqSFYqgPXAwI5
         NEPjf6qCQ/BErNg6a5iPpx82yy8YPs3DOPOi+jBYcQcxZFm/G6RD4CtldZwSIVTiTrEl
         BbYzjhlQI7s7bQPy+Gl9g85I3el4SfvxkruLbXqk9Ayq9sfQi7LKRnYAEXy5/nc+XR9v
         tu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683758; x=1796288558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8p/oKY20OusxDDv41Q7c7EC8fbrlCimdqEtfaz8bn3Y=;
        b=T8rqiFSpgUX8JR3pCHtXMUHSVj7p8vUTeDh32mSXtMx8abYmgrY4VZbCsCMaifimgE
         QChELlBM4PANaN9K/VSJca5Z+bBj89w56EgqVS9BUyhBUPw97FVctMi1zvTiE1qXGf+J
         GAbAWrSQY+cPfTgecO9jpLnL7YGiWgujkiPEh0+bu3O6Fen1DtiJGgXevnEb7QWrNox2
         wKs3jQRIV2OSEZZFAdGB6kLkAgkhDctvQ6xngrffW9wIuCyOCYE52GTKnsiFZJv6xdvh
         ZzS9uXrVXmbq9ivs34A8Vdsx0UX0jQcTe4D6F3j2wlclUkBCpgUxuvT8GTOKHyBJMdIU
         Ytzw==
X-Forwarded-Encrypted: i=1; AL+hErEuvW783nRigtvsmuiJ1bfpR9NXcj8PXYBHivwQH6fgg8bhOgJHLFjrrqD8ynLEZsASr0WOcYmZM2d0EIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nsuBUQYIhUSWF1MfeWlt1/vILs0jm30Cd5x3UDyv9kx8c2hGE
	qy5YZ0WNysLgB03SNtU/XZPyFs/rerm8+AYtdUTqB4pxoQkcDb+LfYcpHRDdkOG14hi2ZDBQUPV
	lsi6chl71HOwrF948IfpDvlObD3HEHtzdEiwWmlHS2Y6mhK/3wRG0GlYugS9nH4ZRKQ==
X-Gm-Gg: AZFdTZdBihiEvsW3Sn2M5c0NYGKf8Z958aVl7XgSg7cpArkfTf4aOZdNJ4XDF9vAJ2l
	k3uEVyptOSSHZ2yDTzfW3koDr5PTfFSyDL0pkDaLz8V/JfWhHfkEyg6Jc9OekvQidhGKIwJKzai
	3fyqqNgFo/iv5FreX1t3Lxkxh0cclIEIsNZHHjfFWD/LRZ271BTcOSuyV+7c2bw+FHzRzDQ4SSr
	vz5agQq0ZnhBgCJXc/0vslyQlZDOF4q3yS3H8TJnPU2VTHiooiDNgmalv8yE4IcYBYe3vXgDab5
	uZDsHEACvlMblaUmUzK5jvnpB/A2pjRFB96rezAbJ3oz4p9+eCqNJXulQZJ+nC5Ts5mCq5VCr5B
	f/KxUMSGG9LjpDW5HPQubjo78SrfbGjHuYLwGjsB2wHOK5Rh2o7yof1ioFJz6A71UVidNBGbc0x
	/Ducr/XnbIdo8xW4a+Wcmz
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr453115735e9.2.1795683758381;
        Thu, 26 Nov 2026 01:02:38 -0800 (PST)
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr453115315e9.2.1795683757931;
        Thu, 26 Nov 2026 01:02:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm595663095e9.7.2026.11.26.01.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:02:36 -0800 (PST)
Message-ID: <fe5485e4-c3fc-4f18-86b2-d37106876c47@redhat.com>
Date: Thu, 26 Nov 2026 10:02:35 +0100
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
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b5f237cf-582a-42f5-8ebc-c006ccecf62f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/26 08:47, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> Am 24.11.26 um 23:42 schrieb Jocelyn Falempe:
>> On HiDPI screen, the default font might be too small, so if no
>> scaling is specified, try to upscale reasonably.
>> The auto scaling is computed for each display.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/clients/drm_log.c | 36 ++++++++++++++++++++-----------
>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/ 
>> clients/drm_log.c
>> index 4654091fe11a..7a0db2690b55 100644
>> --- a/drivers/gpu/drm/clients/drm_log.c
>> +++ b/drivers/gpu/drm/clients/drm_log.c
>> @@ -25,9 +25,9 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>   MODULE_DESCRIPTION("DRM boot logger");
>>   MODULE_LICENSE("GPL");
>> -static unsigned int scale = 1;
>> +static unsigned int scale = 0;
>>   module_param(scale, uint, 0444);
>> -MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default 
>> is 1");
>> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default 
>> is 0 (auto)");
>>   /**
>>    * DOC: overview
>> @@ -42,6 +42,7 @@ struct drm_log_scanout {
>>       const struct font_desc *font;
>>       u32 rows;
>>       u32 columns;
>> +    u32 scale;
>>       u32 scaled_font_h;
>>       u32 scaled_font_w;
>>       u32 line;
>> @@ -72,17 +73,17 @@ static struct drm_log *console_to_drm_log(struct 
>> console *con)
>>   static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>>                const u8 *src, unsigned int src_pitch,
>> -             u32 height, u32 width, u32 px_width, u32 color)
>> +             u32 height, u32 width, u32 blit_scale, u32 px_width, u32 
>> color)
>>   {
>>       switch (px_width) {
>>       case 2:
>> -        drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, 
>> width, blit_scale, color);
>>           break;
>>       case 3:
>> -        drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, 
>> width, blit_scale, color);
>>           break;
>>       case 4:
>> -        drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, 
>> width, scale, color);
>> +        drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, 
>> width, blit_scale, color);
>>           break;
>>       default:
>>           WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
>> @@ -122,7 +123,7 @@ static void drm_log_draw_line(struct 
>> drm_log_scanout *scanout, const char *s,
>>           if (src)
>>               drm_log_blit(&map, fb->pitches[0], src, font_pitch,
>>                        scanout->scaled_font_h, scanout->scaled_font_w,
>> -                     px_width, color);
>> +                     scanout->scale, px_width, color);
>>           iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>>       }
>> @@ -206,6 +207,15 @@ static u32 drm_log_find_usable_format(struct 
>> drm_plane *plane)
>>       return DRM_FORMAT_INVALID;
>>   }
>> +/* Find the biggest integer scaling to get about 120x50 chars on the 
>> screen */
> 
> Something like 80x30 (VGA mode 0x17) or 80x50 (VGA mode 0x102) seems 
> natural. But what is the reason for 120x50?

I think this was a good default with old 15" CRT at 640x480. But for 
example for code line length, it's now configured in the 100-120 range 
in most codebase.
When looking at dmesg, a lot of lines are longer than 100, so 120 allows 
to avoid too much line splitting.
For the number of rows, it's important to have some log history, so 50 
looks to be the sweet spot.
User can set a scaling manually, or build the kernel with bigger fonts 
if they don't like the default.

Currently, with 8x16 font (which is the most common), the default in 
full HD is 240x67. In 4K it's 480x135. So doing some integer scaling 
make the default experience much better.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>> +static int auto_scale(unsigned int cols, unsigned int rows)
>> +{
>> +    unsigned int scale_w = DIV_ROUND_CLOSEST(cols, 120);
>> +    unsigned int scale_h = DIV_ROUND_CLOSEST(rows, 50);
>> +
>> +    return max(min(scale_w, scale_h), 1);
>> +}
>> +
>>   static int drm_log_setup_modeset(struct drm_client_dev *client,
>>                    struct drm_mode_set *mode_set,
>>                    struct drm_log_scanout *scanout)
>> @@ -230,8 +240,13 @@ static int drm_log_setup_modeset(struct 
>> drm_client_dev *client,
>>           return -ENOMEM;
>>       }
>>       mode_set->fb = scanout->buffer->fb;
>> -    scanout->scaled_font_h = scanout->font->height * scale;
>> -    scanout->scaled_font_w = scanout->font->width * scale;
>> +    if (scale)
>> +        scanout->scale = scale;
>> +    else
>> +        scanout->scale = auto_scale(width / scanout->font->width,
>> +                                height / scanout->font->height);
>> +    scanout->scaled_font_h = scanout->font->height * scanout->scale;
>> +    scanout->scaled_font_w = scanout->font->width * scanout->scale;
>>       scanout->rows = height / scanout->scaled_font_h;
>>       scanout->columns = width / scanout->scaled_font_w;
>>       if (!scanout->rows || !scanout->columns) {
>> @@ -444,9 +459,6 @@ void drm_log_register(struct drm_device *dev)
>>   {
>>       struct drm_log *new;
>> -    if (!scale)
>> -        scale = 1;
>> -
>>       new = kzalloc_obj(*new);
>>       if (!new)
>>           goto err_warn;
>>
>> base-commit: bcf5c42d6ed136cc407cea896f131d6893c830af
> 

