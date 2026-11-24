Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555104;
	b=kYvHRblFQEqVN188fKOxD9IWUBLs+P0aY/g5mp2qqtRmttBYgNe9pZhqzYIew71iWVS1
	 xrSSH7Azxl+U8QGDOBGpZkxYlrorOrii6MW4T5YfbV5QSzYxZkpKFs0DqVuMzBZwxie6O
	 6S9fPcNLCVn5B5p9TQ/b2dSw/s5kiTMYxUjHAlZy+qd+cS+JjqKSXF8nCc8/FTc0GKHxL
	 OPWgjxQ+EO7B7m3AwEmFZaZUJRuaL+powFkQwvWGUZUstPU+iSEWHs2Th6fe++VCXJZ5D
	 55ljOQuiCaTAijbBH/Q/QC4Q9CdYvnYwsz9C53fyeEyHtvo/oPldY8PNTMq9MmaCTpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+HkGRbbtT1TH+U6iSoNuyng8v0dO0U3fLdAkGzhy3a4=;
	b=qGJ3xWRo7uggk2Sa5h8CbIXxD0surhHr3E4NH3bdh2zfYt66M6uzHld5mhvEr7tCQfvi
	 Fn8xomypD0VQRyCakF/m6Vn+OKkuzItSHyJob3N1VfEkZXcVfcav7+AaH9qmp4ohez1tK
	 MTLYgZbj2clk951gkRjOsAbKzSpuywnBhVJuNTyOZ9NeqsIVJdR6x127fGdhtOjZ4u7Xk
	 NsOS8YzR2EA75VAIpPkpdFERoHkoFuA8VMutC222cCqUo8lZRC4b0ce/xts05QgA2Hht+
	 wun4RnNuwv4D/yOagGKlDeqDyg4c2Udd/BbRFYwSsUxfZghp7Ej1cq7jNKbZnsQhAtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=philpotter.co.uk;
	spf=pass smtp.mailfrom=philpotter.co.uk;
	dkim=pass header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BkjhYHJJ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD781606A699
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD781606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BkjhYHJJ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2954742f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20260707.gappssmtp.com; s=20260707; t=1795555099; x=1796159899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HkGRbbtT1TH+U6iSoNuyng8v0dO0U3fLdAkGzhy3a4=;
        b=BkjhYHJJjy9b8kH9dLTLdje2YTdVm/mmkViH6oZ/I1KVrtSpxC9Yolwzz5KL1+Rbsa
         ygXeWdlt+cGNQw4G+1qvXD6sPMj39dadTqR3CnWktwoIgUU3bKrZrLQqqf5wyy0lbjbm
         m0ZE8+RcOnLuwsRsVbIrgwA3CW+DrDKKyQI/ExbXDyRESbdtn18epy86MATAdGhfVSOX
         gjNhd1OR5ybkvKONY1Tp6slM9uxOgha18qaAwetLOt5Go166s6Ij3qgmjZCeicb3zaQO
         Tn4sD8czMUEZiTKafBfmYQdGEZKAay5LOuAee8JIkUAC4+MNWEQZ1Pc4McZ/ZioPD0GW
         PLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555099; x=1796159899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HkGRbbtT1TH+U6iSoNuyng8v0dO0U3fLdAkGzhy3a4=;
        b=M/aolpO+5pmXHDLMyGaWlifLJXxXHVx0YTohJiJfd6teq8w60jcgM70ed5GwUc2Ke7
         FNQjcYk/5YhcvXdasxqia/ig76KIj2l1JlCyfkf75nWEfT7fKMl3gbYx0URB6LX/MQxv
         AyAoKF9pXVVDp7cymILIvcXU2c7kVUOyjvWPZ1JI6weVzbv9mu42KhPRHEW+7j0BP0MO
         ZdDBxcT9yUWJ6Fr7snJsSmQvUpRQB0tzDSBQKlXKZ1osTjZ6G88pugzF+6kL7cTuc9tu
         UIaEMwZ2KlNP/xUaHFcYXteJGGMFzBFrU0zXndtHPaBL2AR5b1Us5cBj4YAITMeR7p3w
         y2nA==
X-Forwarded-Encrypted: i=1; AL+hErEnnAB0DBMuBh+eO3s/fu32fwvFUxvvf69xKWzT2nLD/gzbLCPNeHRut4An/eNdm0u7O6v4U+1jkYspB2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dzR+1tSP77eLQ1oTDQAilviPoy6DdJ/1DkCA0UOEwi03LXgun
	X5rueB2M7a68Aw98E/Jv12lQRvFo3zmygLYsSQHiM9oT5brjHmk5rEkwQibuCVhUNMSg33zBNVH
	HEtbQhwU=
X-Gm-Gg: AZFdTZen5qMWcI0uaKxjV+UvO3ikX0VBjbgbpR5M7Dskozm1KeDDXGAeU37y70tOtgX
	+isq8m71OaMU5o3VCWs5J+/GuBH3IzHFm2mnAvu1H3rEe9PI9PacZMY2UBVEydxz8jPw7peFmRS
	mkG8W0Tn+hntrOvc7Oc8zzcmkHhfYTGZE4R+IAn4uGXXCl6ffLu9C1oj5/zFHexd2F4cO1V22oD
	brvQAZVwB0uBMeAhaS85fZLVRENg35b3sSrknJ200Y5lb4STyR2g33EEKh4mJaPSTsjBRWtAFFF
	WJGoTpDrztJ0VIt92344RKjLC6drp/HI+EG+Sx0/aIAmqmPNxXN2ntZuIeCnUV/m9LaIl9HXNUg
	ismZlvVUQineWOKaoCTUKbtHwOUFn0HhRlmDpK/xP/xT4KEo5elu7hPiZoo6+LMYQO/BOoPhZ9e
	Wij7ecnnN9Ncx+etf/FosU2D3Q2mHqva5NdrTvmL/asmdPDP28zY+uKB+ti+rboboOX17azFcT6
	2i+c0yAGZXfdDwv3ZyUCbHzhNMRPIfabljPtb/MHQDU7n5gkPNhzfS79B8B5GhQ014MMB9DIdI=
X-Received: by 2002:a05:6000:4808:b0:4a9:760f:1843 with SMTP id ffacd0b85a97d-4abb0d51e12mr30494655f8f.27.1795555099105;
        Tue, 24 Nov 2026 13:18:19 -0800 (PST)
Received: from equinox ([2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm22281751f8f.15.2026.11.24.13.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:18:18 -0800 (PST)
Date: Tue, 24 Nov 2026 21:18:17 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Jay Vadayath <jay@artiphishell.com>
Cc: phil@philpotter.co.uk, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cdrom: bound the device-supplied offset in
 cdrom_mrw_set_lba_space
Message-ID: <awX_GewefzBECYaK@equinox>
References: <20261111224541.56371-1-jay@artiphishell.com>
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
In-Reply-To: <20261111224541.56371-1-jay@artiphishell.com>

On Wed, Nov 11, 2026 at 03:45:41PM -0700, Jay Vadayath wrote:
> cdrom_mrw_set_lba_space() issues a MODE SENSE(10) into a 16-byte stack
> buffer (char buffer[16]), then takes offset = be16_to_cpu(mph->desc_length)
> straight from reply bytes 6..7 and does buffer[offset + 3] = space. The
> desc_length field is fully device-controlled (0..65535) and nothing
> checks that offset + 3 lies within the buffer, nor that size (derived
> from mode_data_length) fits. A drive that returns desc_length = 24 turns
> the assignment into buffer[27] = space, a one-byte write 12 bytes past
> the end of the stack buffer.
> 
> This runs when an MRW-writable CD-ROM is opened O_RDWR, so a malicious or
> buggy USB/ATAPI drive (or an emulated one) is enough: no privilege beyond
> being able to open /dev/sr0 for writing on an attacker-supplied device.
> The sink lives in the CD-ROM core, so it affects every cdrom driver
> (sr, ide-cd, pcd, gdrom).
> 
>   BUG: KASAN: stack-out-of-bounds in cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
>   Write of size 1 at addr ffff88800639f6db by task poc/133
>   Call Trace:
>    dump_stack_lvl+0x64/0x80
>    print_report+0xd0/0x630
>    kasan_report+0xe5/0x120
>    cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
>    cdrom_open+0x1169/0x2080
>    sr_block_open+0x9e/0x140
>    blkdev_get_whole+0x8c/0x200
>    bdev_open+0x214/0xc40
>    blkdev_open+0x1f8/0x370
>    do_dentry_open+0x408/0x1290
>    path_openat+0xb2f/0x2210
>    do_sys_openat2+0x126/0x170
>    ...
> 
> Both desc_length (offset) and mode_data_length (size) come straight from
> the device reply, so reject anything that would not fit in buffer:
> offset + 3 >= sizeof(buffer) or size > sizeof(buffer) returns -EIO before
> the write. The sibling cdrom_mode_select consumer of size is covered by
> the same guard.
> 
> A userspace reproducer using an emulated USB CD-ROM is available on
> request. The fix was developed with LLM assistance.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Jay Vadayath <jay@artiphishell.com>
> ---
> Changes since v1: Updated commit message
> 
>  drivers/cdrom/cdrom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 4f1fd389260f..5e910d79045f 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -571,6 +571,10 @@ static int cdrom_mrw_set_lba_space(struct cdrom_device_info *cdi, int space)
>  	offset = be16_to_cpu(mph->desc_length);
>  	size = be16_to_cpu(mph->mode_data_length) + 2;
>  
> +	/* Both fields are device-supplied; reject values that overflow buffer[]. */
> +	if (offset + 3 >= (int)sizeof(buffer) || size > (int)sizeof(buffer))
> +		return -EIO;
> +
>  	buffer[offset + 3] = space;
>  	cgc.buflen = size;
>  
> -- 
> 2.51.2
> 

Hi Jay,

Thank you for the patch. Unfortunately, I'm struggling to reproduce the
problem with your reproducer that you sent previously. The patch itself
looks good, but I really would like to see the KASAN error/stack trace
myself.

Can you please send me a single poc.c file with no other mechanisms,
scaffolding or scripts. Ideally I want to be able to build and run this
reproducer and within a few iterations trigger the problem. I have already
built the kernel using your supplied kernel config options, but I cannot seem
to get the problem to occur. Triggering the precise conditions the patch
above guards against should be enough. Thanks in advance.

Regards,
Phil
