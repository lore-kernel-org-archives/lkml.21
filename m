Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203614;
	b=1UKtnxl7bp7CjkBqsxbOWHUg/roy3kTTMFcJASnjx/y80N4qy9325R968RxZ11XOFV8j
	 PC3ajveW8jKYAg1RKNiRKjdaT/T5FYrf0k2TXdyBz3ebBhYFfBudLRtjp4tqONoFHywON
	 b1YmbSZCTy0U4ZtkAKTpmtLL6RZoBkYDt/g0WfZFkRqLF+kZyBNUMaGjppDSnFnau7rhc
	 hMfxk+Ij4u6GWD3ZZ0+rGUq/QB7mp8VKzH32yXfV+zfKbfGCGCWooQWon84VzmqbozAxP
	 3G0sqMfJGRsePdPGFLg77tFRFLdU521pMbZ2DgHx9R+Q6xbbtII2+d16EZ4hzuw7xzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
	b=b4kCgDVbKxlBtBNEsi0x0L5EkPOt864ct/yZ0IUI4OYRGjkjnUateaXO6K2hslcrDH8G
	 YhyfKJFZZfIghWUY3ttXjL4wEUVgjfYYBWI0afze/MB9b2Cb1XQV28KvdF7QIm5f8WaJW
	 DZbyoznaJvjHs3G8W4OzFzcakwIbErWKB70xzSowXIz5zDOyJuIpTdbznBRUePGtbnQf0
	 ICAbd1WAdFy7kz/S8O/Jres7vIW279Hvi8zWFBoQlJswbpHJ79MtlNwHr6cbS/18hLonx
	 guujYcJt6SSgdKqqwGW9WYdaOdSiJ0SoAQasmyFUvwxW4Wwm0wrjt7/4LAV8Jgxoadg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq6I6rYm;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AFB606A6FE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AFB606A6FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq6I6rYm
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc53938a8fso923652137.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203611; x=1795808411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=Vq6I6rYmewD4vEX6D5UKtWkxHcWMh3mpri0JU+Zf5Xj13Pm1PwfFX3FPe06ZvNci0p
         cp9c1+HiAnx9zd2Cp0fm3fFuymCsJkbjg5jNy/VHQkmG8dYQ4n/cc8nOMWSvpLDuAsjB
         hn1cpco6ehCfunHGczyGqIsUEdMCcdW3/z5qYByXcWf0ukhvaUK6XkTAlLh5Udprl3Xr
         vhXVCBjYw+YuyisVLCdExyNe+dVM8sQbGVfhoNRq9WCeb22+lVqC4lNsWzjdYZxHgUOo
         Xpy5ZjTqZjIMLoC7S4EP0Myi6X1N+Fkih3D5J8U5iXdTwJ20c7XjjD6J2OSiXhD3kdZy
         8qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203611; x=1795808411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=IoPFuYJNrZJcCb08vV/+z6b33UTiy9Dk+YtjUYyMtNNlGyNOy6aAjrUaDbULxi5Fwz
         rwTpE4CexyIpoQNUgSPvuVtIyKhprTxNGU6ZcBLeej7vJTvS65QCQFY+S8kuFO1tOzdM
         Cv+MVYe2o3XqR2o04kEtBrkcZQqex1sJe9JohLIBAZCOv2GhSKDFUpEEgl41andMl8WN
         kW9Zw09VLcycRzu2OtPjXfu7dAJsblZuR13fWz3v/A7sbZeViGh9iUiBLwJ7oCj+SyxL
         N78QEAXenA6vRbnguGSfk7ztU6sdNehj+cJTSUwO1lIbeG0I05obmKDr7lqTKGfVgsk8
         UIlQ==
X-Forwarded-Encrypted: i=1; AL+hErEFN+q48x66W0cV3lpCOZ+X5H747HRxfGliJN8o9J61Zng/4I0xhrbxEDVIsZDm+wLwzcEeiATmEyjm+bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b6LA0m/Ii02tAhdf0mLQ3mvPA/THlz1sNW9heCDDBe5JgfAcx
	bcnTZyfZj71H5G2GaiF0tAxF1QMTu+8ySRezmmmUdyseiihVcj200hc4XCR3Zu58Vbs=
X-Gm-Gg: AZFdTZehtTvHTzjRehALiYhmzlfkermtbH4lwLIgVJy8+sS88nXZIr+2lhzhm04woEi
	cA9obO4w4EMT4NQ9mOT96Wbu92GLmnWhqw8sfGeOVMHAXm22cya6kz7gGe3g2SoK3qLp6RdX9/c
	3sP2032QGW4TUpU+DHWeczQFzjq0I1Ff54vxXP+sELnNoi5rP4DW70Lw1bbrEKv4OJBjX2GFnQO
	ftpeLAZlIbO+gXPxon0Dupg9GLrRP1lsiQowsDkXteodqEgEYhG8b5TTy6TnFrHwEBjuCeEcmiU
	p6Ow5nkVv7ZI9x53+6GF/Pzj8sbXjj728XRkaOPkFMyMLnMmMYgwVbRjQoutjy34ssVLb3Ydi6d
	QqlBy4UzhkHHBYMobITVzfh1vcKqyUiEoPJjqRtLCWPcrA3sRYSlQoAdl8JG56cniBwORSTzAM1
	AmYVPjV38GzJmryp9pJmZMviAGXz1V1aP+5MTIRi23mWMBKRFih/xv2cO+wQNOneFm2oSCClXsv
	WOTWrDmVnW+ayEmN34GP2Va7v3+Q2pD4jlEU2obQgCxbHqr6ozKoa7jEXhAfu7C/0KEQZ1Mmr08
	fUxrCeACiP3/OMHccXpxJqcynpS3TOAws+KiDxwjs3XUIwBSJFzzdVMe5+DU3P9JVifHbKpIi00
	TNpr1XgKVPM0x9zKMXZXA+Ks/UbffFyHvKGzY
X-Received: by 2002:a05:6102:5091:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d7393ff1eemr1985327137.7.1795203611220;
        Fri, 20 Nov 2026 11:40:11 -0800 (PST)
Received: from ?IPV6:2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28? ([2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm3845871241.5.2026.11.20.11.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:40:10 -0800 (PST)
Message-ID: <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
Date: Fri, 20 Nov 2026 16:40:04 -0300
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
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 19:48, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Changelog:
> v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
> v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
> v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
> v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> 
> 
> Feng Ning (1):
>   staging: media: atomisp: use kvmalloc_objs() for overflow-safe
>     allocation
> 
> Rodrigo Gobbi (2):
>   staging: media: atomisp: use kvmalloc_objs() in make_histogram()
>   staging: media: atomisp: drop redundant out-of-memory messages
> 
>  .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
>  .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
>  .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
>  3 files changed, 41 insertions(+), 76 deletions(-)
> 

Hi all,

Gentle ping on this series. If there is anything else needed from my side,
please let me know.

Thanks,
Rodrigo.
