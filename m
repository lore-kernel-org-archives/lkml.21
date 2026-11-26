Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725214;
	b=QNhoS8YL/D6vVj6V176iO4JEWMAQl5k8Qqh92g4nDEn89JWdrjlUUtVsT8JmP3OdHezC
	 SzDKYUI2fMgO8UMAFuBPszrmM/rCdqg6eDkJzIfhD6ITX4/8Iustmn+0Jrpap6eJlBOQx
	 qyzI3MVK+5R1bT7jmfCtDMnzUPbELPZZnhcoPK4ZaLaDt/JX93QTRF7SJHZrezGt61SSp
	 O3GjErInvDod8c+t6MUYBCZHTyZv+bcc035EncF3kNvqophoaEFfaX9c8POzLm7rkuI1a
	 8ZhTGzQt2yvRPN9yqRfZaBm/TE+Tcxt3KlaFrIL2Jzv+Eh/oHGiL1v1jxdkidUAHVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
	b=cO3dp7MUR5p1UXQm0/QWyySSHLwazWAr9gCB1ZaaCnQGqb51KEca3+gF3I6r0WEo3N2Y
	 W2JroYDQqofcKxlxBV4ixWXcQl9zTRU3le+hgcUPNhlaT3Ur+63sfNu0zWB8i9Ems8Wag
	 oVZc/PMQM110iZkkUZE2irf2v0K90JB/5gdmk3EJcAlUvX402+7hvAhkauB5h38ac1JnD
	 6MdqxwAEr2pzc0CCTDdRtl8YZFUTFUkxKVnTuj7m6kYQjrOmAftmsOPWMBWioQ5QCzHc8
	 Cif1btnoSRc7en9NW50sIKH4xTzDBGMzUtL+An+KjJK8aR0H70uZ8oo6BmfI1N4H8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3Qv+LbI;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B608606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B608606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3Qv+LbI
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5e147f101so725487b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725214; x=1796330014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=i3Qv+LbIaxFkVwQ2sGh2BN9MbVIIwI5k8Lf9gAawDXQA0ibCqAzAbLlbk1wUbwH6GK
         hIEYTRTcJY5BXTF86xYfP8L9LCSukBQc+psjvIKRVyyLDGW91fWTFzwP11tHS5+dGTW3
         kBrzUSuzjHJuPBjKYcm4+B6wmcBv2LJ2NMPeuxSsFaPsV0lsUzqExm+i51qKybFWi7FW
         gCvKOd8/m2n4dC8L+Nqp8tlpz7XDUkfcbnhkApltekz1cp59D0/6Av3NAHWi2LjZ+A/R
         jliVfEyE8RhyJgoRFYOBztEo1sRInZB2WTwaBD3q9HiRAY4TMEExRXkcyeYseAPc4bsg
         Oxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725214; x=1796330014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=2ro4fVHCcNR4lbY1+OYo3awIyo/JTYoUBJRFIFFaVqaR8vl6WeVUUgdvmm/PpO/Zta
         s6bFA7G+VhDHpG3hP4NRJJ0uJ0Q7SmW3JPDWf1gWybYRxH7anuwPvPPN0Ku87G0wtYU8
         hdsiW+A4oO78r4MQoQ1onr0u7j92zJpkQQuo1QnWNzDP4nvQr+CtVEFewA6CKUGLGne1
         p58+ixNSPgeg8u8zjenqscvRoiYYMCIelmgtnhqulaI5JHdzhIt04LqzA52V5h+SP8tI
         A31n7FhUwdHC6S0e9xrZ5C9iZgkVKEIAiF1x8eIuORftR7cUc7b76KH3NhxlNUQTgaxn
         EeWA==
X-Forwarded-Encrypted: i=1; AL+hErH6ldh5N6pcJIK9BiT57pl+4Fhehn1EbUI4QcTkXY9FNclHIL3vLWsVE7QFQVDkrNsbKJj+QS8YbhBfO2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xEspsUngG0n4SqXdf6OL45132G1+kLhrZSYXRljqoC85XBLLB
	9Dno4xfrO+AELgWhUwXSDjq6sZ9HiD2LRUhk9b68SrC42q4PNB6hIcZT
X-Gm-Gg: AZFdTZexv49bZX8yMxddsZ4pbHU/aPDXJGEuNGUE872pBC2rTdI8vRUV85wIZOaFchg
	gtxO4z3+l1nQ6FU+cR2AHt8FOAHFDBWyqMno6jBOYmH7HToOxHnZmm1QqD+3Er/e6um4ezFzv3j
	vY62bGJAGi0E3iIqkhl63DIydM7ygzMyJSnGSqhdyTSyxQEnCuNbskSnJrMHY1lh73d9znUOo0z
	0563tzFR8V07Tg906uO80KbHMAfoo+0DG5yG5aon7vO/QynAJ6gphPlL0bINg4IyyBHnVv9IHVx
	N5Jn6xFXMTPuYSv0zurF3myiHqstiYc0MY9RK5h0Y4Erp7Q22eAyherVGu0jBe841mpLTC2P8YZ
	D1fqS7w0LmA7k2P5E/L6UBIctVButwHvSE6gpOCSqY2cLzbfO8/FL/mJHojWZSKk7h7tpGuax6n
	kYYEFPIQN25W4bToP5adz1F8QWZ83D/HE/UM8nd+dnrFg1iuNjSKbpeZoLHjDwCkguknlPKMQlP
	XmInXcyoAWdhd3uSzgV3dbPA0F1dwyN+2KNef590WPzvAzwmteuidzqZkNc0lrCG1OJho4dyBrj
	gS2dZ/Mt8++/LQECixLdgPY49NPLgJJbMIvehgCFg9S4h88vGn35yiKptzI=
X-Received: by 2002:a05:6a00:6f6a:b0:8c2:da80:978c with SMTP id d2e1a72fcca58-8c8796aab2dmr30978453b3a.1.1795725213712;
        Thu, 26 Nov 2026 12:33:33 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:85d0:b069:3959:1d31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87392d408sm11154247b3a.44.2026.11.26.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:32 -0800 (PST)
Date: Thu, 26 Nov 2026 13:33:31 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline
Message-ID: <xf3wywxva4ogx7zn4urfkdgoldaamo673v2l5qm74trf6tjofx@g3gksm7mv2yr>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-3-faizel.kb@gmail.com>
 <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>

Hi Michael,

Thanks for the inputs.

On Tue, Nov 24, 2026 at 12:13:20PM +0100, Michael Riesch wrote:
>> +static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
>> +				    unsigned int plane, u32 height)
>> +{
>> +	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
>> +}
>
>Is this the same as v4l2_format_plane_height? And if yes, would it make
>sense to reuse this one (of course it must be made public for that)?
>

Yes, apart from the block height alignment, which is 1 for all rkcif
formats. I will export and reuse it.

>> +
>> +static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
>> +					  struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
>> +	u32 bpl = pix->plane_fmt[0].bytesperline;
>> +	u32 total_lines = 0, max_bpl;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < info->comp_planes; i++)
>> +		total_lines += rkcif_stream_plane_lines(info, i, pix->height);
>
>Just to be on the same page: What exactly are you doing here?
>

When bytesperline is increased, sizeimage must grow with it, or the
buffer is too small for the DMA. For formats with a single memory plane
(e.g. NV16) the Y and UV planes are in the same buffer, so sizeimage is
bytesperline * (Y lines + UV lines). total_lines is that sum, and it's
also used to limit bytesperline so that sizeimage doesn't overflow.

>> +
>> +	max_bpl = min(stream->max_bytesperline,
>> +		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
>> +	if (req_bpl > bpl && req_bpl <= max_bpl)
>> +		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
>> +
>> +	/* The Y and UV planes share the same line width. */
>> +	if (info->mem_planes == 1) {
>> +		pix->plane_fmt[0].bytesperline = bpl;
>> +		pix->plane_fmt[0].sizeimage = bpl * total_lines;
>> +	} else {
>> +		for (i = 0; i < info->mem_planes; i++) {
>> +			pix->plane_fmt[i].bytesperline = bpl;
>> +			pix->plane_fmt[i].sizeimage =
>> +				bpl * rkcif_stream_plane_lines(info, i,
>> +							       pix->height);
>
>v4l2_format_plane_size?

It computes the stride from the width and an alignment, so it can't
take the requested bytesperline.

>
>> +		}
>> +	}
>> +}
>> +
>>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>>  				    struct v4l2_pix_format_mplane *pix)
>>  {
>>  	const struct rkcif_output_fmt *fmt;
>> -	u32 height, width;
>> +	u32 height, width, req_bpl = 0;
>> +	unsigned int i;
>>  	int ret;
>>
>>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> -	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>> +	for (i = 0; i < pix->num_planes; i++)
>> +		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
>> +	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
>> +					  CIF_BYTESPERLINE_ALIGN);
>>  	if (ret)
>>  		return ret;
>>
>> +	rkcif_stream_set_bytesperline(stream, pix, req_bpl);
>
>Wouldn't calling v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width,
>height, req_bpl) do the trick?

I looked at that, but stride_alignment is a u8 and has to be a power of
2, which the requested bytesperline usually isn't. For example, with the
IMX415 in SGBRG10 the minimum is 7728 bytes, and libcamera requests 7936
for the 256-byte alignment of Panfrost.

>
>In summary: I think this is a common problem, so there should be a
>common solution. Reuse helpers, or extend them if required.
>

Agreed. I noticed that some other drivers, e.g. rkisp1, also handle the
requested bytesperline in the driver itself. For v3 I'll add a helper to
v4l2-common that fills the format like v4l2_fill_pixfmt_mp_aligned(),
but keeps a larger bytesperline requested by userspace, up to a maximum.
It computes sizeimage with v4l2_format_plane_height(), so rkcif doesn't
need total_lines and only calls this helper. Does that sound good?

Regards,
Faizel
