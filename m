Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476845;
	b=Nwjd9HeUeotPFA7W5zscRLBfMMNAOmd/tnn6zIGfPY9UDXpNqVsI5qPOJ/mdZ2hZ46Br
	 dEe6m+utqmyhGvY1h4zkkYlwV3qiV8vaM+xZCQLSgzkh4uC7KSrFEGF6onuRtaJuvSMXA
	 X2+eAoY4o2QEgRLocMSkIegz2yfKhqwFkfHBFpLJ8moc7liZpmDuY6tgNTbK1+0U8n4Ac
	 02KoM7rbNWCugv2K/rtZj+0SwM35aLnOi4G3J6duRFfCXwe+xUuOaAsVGhvtWbNSjjMNG
	 QSG7b32Vb90Zj/fcRm+s5G+rvhKLUj1A3SNRR0ryUuB8SkAZiumCmyRoCzHR70tWpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7IcPjHhXTKgcJV03DulR1iJZw4+6JP27TqhtQDjZqv0=;
	b=nvtvoUXC99s2kY/WQXxoshMmjaUsuxLOK4UkGuXEto/ZxlynvkEU+fVBJfc2FYXxm8qu
	 5bHZpyVjzambSwSNjE3k4dciEpFDZFgiBJ3MdXWmR6Ncm5ysHBFW/D0r6/EPoCYEOcegN
	 YS9iys1tQGkVL1iidEigIULBgpxrY4hzPnppreDJPIUW8A0IcKm2zLtaQ7sZTG9p6UQ90
	 qSiHDfAgTlAsFjrALvCwS61O0407W3kax/czeJDRLDzoLdZIxdarJ4dvCxzfxshmI3l4M
	 UMaDZdqO//NooTWx8wAGyIEU/3y+kPgFqdGhkHX8cU7qyGzRgPIBeh726aIq465/+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YN6bU/nl";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A0B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A0B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YN6bU/nl
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so427641c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476844; x=1796081644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7IcPjHhXTKgcJV03DulR1iJZw4+6JP27TqhtQDjZqv0=;
        b=YN6bU/nltpD1xwu/Qd9NYjrVRFb0k2cJwke9ul+mK1BCcleQioDj9AR/C0s4c7BIoJ
         ew7gbesA3mNrTgTtc17FzwLrLVe40CtHlE1xS3y2EoQQPgIUgkUGq1kY6tmcr4NDwkyK
         619PYDPFWDC7jEVK4gUdsRqSHK1GzylbfeuP62GS80KYMCrPcTsIZryAPVIV1Jp2019z
         CnxcOx+l/Vz+1WQskHbW+hmBVm3gcfULXmavtkpG/6hUP81jNvEaUr4uW9Ms3IikJcvp
         YL9dUIPsl4mblyDjDgVKMcmsVj7EagB+MI3hJvuiNCJ5E4xfd2LLN7y+eYwr2oNdgZi2
         AdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476844; x=1796081644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7IcPjHhXTKgcJV03DulR1iJZw4+6JP27TqhtQDjZqv0=;
        b=j0v4kpY2XO/jUt6B82OXR17mo+pyPdsSJ6S7UhP1kjzyMeeNQsU9JxCVOw88v262/O
         3H+PKUCz+hhkusu/5Xb4EyLYiwbm0L3hlV0CX+r6wR/GffoE7SJr7VdEme+/VPA2tDZN
         yDbVHrAC/ydgcIGvzmD1+A/099gmIX0maV3+TdbQUxRtN/TNc/XYwKPduiOteIVhLF7c
         yljbzbMze8xW+jDI6zp6hH7ixf4MzO9r2GCpYZQuiVppZQ4LZ0lbZDtVcnD9UCd160bZ
         2w57mZLE+2H8I4xr0kLNmLiLFEVcnr1cZ1c0XPK6k3/770EW7xUHIK1d6MtN2kw+8el6
         phcg==
X-Forwarded-Encrypted: i=1; AL+hErHc2BCQINMql26gfIfKXr7AEh1EWOP/LhzsccrurVBxgURCS2Q/Rn8xE+1WMBwuz4gMlbYlXSvZ7juZLYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z905wlhrD9AgmHbf8CA1cu/1GqnLke+j4wlyDLje0K0ykRy6PD3
	y5yboWUT1C5nhzzhXnZfRdxSPDLWgPXtjXlJAILPQ6J/XxA+ewU7lkCH
X-Gm-Gg: AZFdTZczu2Lk4fcJjWzrXy/Ifx0tHPmtPfvuKYNU9muWFL469bOOoDS2Kjpftzw0lkA
	l46wDnTwMvs+lTjgdwuqAs7QuYbT2yaXeNDJpEpXvG5+d6+dPGmIrRkUuNcLsFUCGQrBXGzdd1R
	v2WuhtX3Rog5y8XlBNJ06OtRxybXxcCsVmHZmjnfCCqdaB9PAFgWLPQeNfTT7svU+wnYLmKjjPT
	TrOPfl78kChZx7JdiifGIqTAQUdQxPLUiqqO3JzrTM6SEDqXGXH1G/KTvQiCE+n+RubU7OLTc3M
	UuJWNLUw2MF3L5ljSXpS26rQ0k5TJhOhVqHG1sdBVWIIOU1rVaOm8m3ei9EFxmL+iuAag4p3+EQ
	B2h04e4QPIAfLeZI6GtADxl4bXgfFRh9ct6EadMJvHfSVSbbKOVfUAAYYCzgA6naHaD545YKArw
	IFil7TgIIbXRY2kbYWaM38sBOnMIQJlE72ncb1ek8PCfImhf9IJ+oJk8O6C3z9tBVJbZ4BT4DMw
	E7bXDs5qoWUZnz8ebmHLc2DxwfQg2ZuCX51TAITvx7UJ7QLXTGJ+/1008lcYSwuaxVlhu59GxLI
	1tq6LFgFZiow+uDX2zq8MNiSakWM8C3PeWviPGrLYqEJSDONb8aJKdwPu0GNuXOgbmCKBUw=
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr16499755c88.18.1795476843673;
        Mon, 23 Nov 2026 15:34:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm32516558c88.5.2026.11.23.15.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:34:02 -0800 (PST)
Date: Mon, 23 Nov 2026 15:33:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dudley Du <dudl@cypress.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 02/10] Input: cyapa - validate firmware image size in
 cyapa_pip_check_fw()
Message-ID: <awTNTSz5mxJ_AaME@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-3-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183200.3900004-3-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:08PM +0000, Lee Jones wrote:
> cyapa_pip_check_fw() parses the firmware header, the trailing
> application integrity record, and the application rows without verifying
> that the supplied firmware buffer is large enough to hold them.
> 
> A truncated firmware image smaller than struct cyapa_tsg_bin_image_head
> causes an out-of-bounds read in cyapa_pip_fw_head_check() and can
> underflow the unsigned size subtraction in
> cyapa_get_image_record_data_num().  An image containing a valid header
> but zero complete flash records causes image_records[flash_records_count
> - 1] to read before the start of fw->data.  Finally, an image whose
> metadata specifies an app_len exceeding the available application
> records reads past the end of fw->data while computing app_crc.
> 
> Validate the header size, ensure at least one flash record is present,
> and bound the application row count against the non-integrity record
> count before dereferencing image_records.
> 
> Fixes: 5812d3067294 ("Input: cyapa - add gen5 trackpad firmware update support")
> Closes: https://sashiko.dev/#/bug/linux-cc76de59-950f-4e64-b49e-7605164e02a9
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied with some minor edits, thank you.

-- 
Dmitry
