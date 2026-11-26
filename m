Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655838;
	b=VuZyUrjUt4HdNF5Rmlt8+W/Yxq7t0qNrGjVO8rLasgpHN6tIiUSQksN5rolLvlRHzuU9
	 nF/N7P9LWobzFkooADYprOg0nHnhnQ99HrAEo7ksUXnVbTbp02fRuqryC3dFXBqkPlSjm
	 U5fhPDcICMa9SnFBkHQnBePgN2aFcdBh/g8hNar6zXF/liMhmatjZJdRnVNoZylBeaKbj
	 a33FfeRP63koLJJe3am/v+Dko/J1A9BDzDfQzeLc4LM+rJzqCluiRqaM/YbSaDiOJ9Nri
	 QBont+v1zllfKH+oJ1Fl63e+3oX3ejNC3y6a3sSJMu399qGQXRYlh6aFgiErOwNY7Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
	b=3wojuxri1H3A8K8O9ORnJI0oZ7uTHIWwk1rEMgdQRoMkWhoJVINbTrUDgADXqIKQTdsM
	 TcqdIr8lek642Wnwy/wzLP2Yvfx2pHLu/rKWOMFNsoTiNo53qjNBUOHcsyXTDaFLvLzVs
	 F6XId+PtsP+8iDTndbQ2WGOwajDB+QHmjf5SJtnikO0fiK2jskA0g26lBtNbviuitDkZy
	 ZUtMZPOu5jnr1QNSas3uCQATeOWf3vCnZHOhRNDafAkJdLiLoaRs28s6gJ7qTwhoVZyTf
	 HJTJyc2DylE8sLv3+WugORMOz+kmOlKTxMGesdhyz+aPmhunAvSatHff0raTwKf6uuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EuPcaFp9;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDCB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDCB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EuPcaFp9
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1226830566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795655836; x=1796260636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
        b=EuPcaFp9BXac6sMmb6amC/sR4AV3C810SzQPpUadP/CfYhNJy95HQsqugEQEF2j6X/
         hM9gfQzFVGfyzTwTLXpS2VwXeFVoKiz7QXps9mnzKN+jSK5XrUvLQErzOEBZ/SYP2uOX
         G3j4mAXF0nUzjlVKJrVvXV4JEl/A8e1PcamDXVPTTvUeHC0JpBHWGUBCwXPrnQmH3n3p
         j0y3yd0wXW/9fQJQariK7blt2FBn1GiGFGUIhMW3zwY7qsr1Xop+Y6wgHYs4DkmRt0ZT
         XHk6U65FBDhQo8yOok+iVuRTpH227Jp94oddWifomkp13/RdmxXbFcExrnj0funb7Zmj
         OQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655836; x=1796260636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vhDEbyn1nkYBGZ2jl97YuxcDAz2vqULbU/VOeX9XGM=;
        b=fH+MTHQu6CYe4QzYUxjrj7eRLq/QLyGp+D4rbPvpOssh97+NBxiq/YANCxyVWF4AHO
         1kCN1+2YUHmd8He1nSS7c8jwJMP0xQM1dNxQQqB6fb13Ph/odcHn4rkTXm8Xh9Gg4D+e
         dSswvFktbDl4TGw/wpx7iyMGgJMSfrmreR6pHBuXpemfvwly1QnU/wHVOfhT1MjidzTi
         oKIIsZXEgBaSXsD3nKvBVDlU7kC269gDNxb0u7N2vgHKJNrWGp9zSElf8vUuf76j5exZ
         uN+2JIwQCPbCpdgrdZyeXENAOo1maTQjlVVN3F0RbmH/S8DqnV1bEEgY+MD0hL67MzwW
         5ohA==
X-Forwarded-Encrypted: i=1; AL+hErHEOISfMJyYAbKt7yySYVMK6nCoPANP4Lyo59+NhVV7SBSsoc3uThFFQoqZDrU5cGiE2uQZsGEnw6UVkFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NHPUFf6d5EZYE4d1+NItNZBPWGbjVcQkyFXKOQYfOPz2IJLJ5
	GmJ/ro0FSJkEO26Gb1D8jlLt6E8jGQsccy4DOOJCqAelblwOiBYLoQ47ODFcCb5AkwY=
X-Gm-Gg: AZFdTZd3bM/5UMBLHanUyueubmKGpw8tzFB0E8nyHu4k+lrhYgSJJCanvqgIw+WuKbQ
	syUa1tg/4TBuOaAp+znK74jbCcV8v2Xse9qTmxQo3TsCnVCky8dmj2B6qz8Ok3IQ+bM3Q1eiAb5
	ss6MgIoc4ugMW7vTODnkVJric9LpJmc27xLLlvwtoKJfpaaBPtkWhsfg9JsrQEoFIMC5tJxrMb3
	GZZtj1RW6INzdRtkUoq/9usR8Ny4XA+TyJOTam1HahxhHGCMJmzQ9QQ2lceMGsN4OnKENXXc4Qu
	H9JBMjBLOP82YR3uSRlitmLRs4VrFqi9quHgYDZLv0pjnOTcrYKPQMamTzDPfsMVntUpPSgxNl4
	SllUgKOc6dMd3Y0BMHtK0UwzM/jp5/3B7NpQDR6PYerg2QvzpXN3wYc/MblhUJ5UKxpj7OLbGK9
	oMETRJRS8noRB3a+RP98h24xoPS1XHYM/he6T9F9NFQY9BxpEy2vQzEvuoQh5U034LvjRtQxkmb
	D79vfQLz3BjPvwMwwzzqingFJGQmQTlkIm6cw2XXsaRWbQ22++hACmRkbhVCedKO/3oYh8iNqtO
	y0H+OF840+++bJldRCD7lS8tcusZ4qTPAHPWaDxz5No=
X-Received: by 2002:a17:906:730a:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c51319443e5mr1859065766b.23.1795655835781;
        Wed, 25 Nov 2026 17:17:15 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm9716494a12.15.2026.11.25.17.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:17:13 -0800 (PST)
Message-ID: <03dd7e64-2357-4e8a-9383-d748b4883efa@suse.com>
Date: Thu, 26 Nov 2026 11:47:02 +1030
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
Subject: Re: [PATCH v2] btrfs: tree-checker: verify tree_block_info bounds in
 check_extent_item()
To: Elkin Cruz <elkin@google.com>, David Sterba <dsterba@suse.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com,
 stable@vger.kernel.org
References: <20261126004332.1712403-1-elkin@google.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261126004332.1712403-1-elkin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/26 11:13, Elkin Cruz 写道:
> check_extent_item() only verifies item_size >= sizeof(*ei) before
> reading struct btrfs_tree_block_info on non-skinny tree block extent
> items (BTRFS_EXTENT_ITEM_KEY with BTRFS_EXTENT_FLAG_TREE_BLOCK). A
> crafted filesystem image with 24 <= item_size < 42 causes
> btrfs_tree_block_level() to read past the item and potentially past the
> extent buffer's populated folios.
> 
> Verify ptr + sizeof(*info) <= end before accessing
> btrfs_tree_block_info, matching the inline ref bounds checks below.
> 
> Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Elkin Cruz <elkin@google.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Will push to for-next soon.

Thanks,
Qu

> ---
> 
> Changes in v2:
> - Use (ptr + sizeof(*info) > end) with matching extent_err() format to
>    follow the existing pattern in check_extent_item(), thanks to Qu
>    Wenruo for the review.
> 
> v1: https://lore.kernel.org/r/20261125221849.1424464-1-elkin@google.com
> 
> I am trying out new Clang static analysis checks for kernel bug
> classes, and they flagged this code as possibly buggy. The findings
> were triaged/fixed and commit descriptions were drafted with help of AI,
> then checked against linux-next (not runtime-tested on hardware).
> 
> Thanks,
> Elkin
> 
>   fs/btrfs/tree-checker.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
> index d2bf21c7b848..40f2355cbb1d 100644
> --- a/fs/btrfs/tree-checker.c
> +++ b/fs/btrfs/tree-checker.c
> @@ -1665,6 +1665,12 @@ static int check_extent_item(struct extent_buffer *leaf,
>   	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
>   		struct btrfs_tree_block_info *info;
>   
> +		if (unlikely(ptr + sizeof(*info) > end)) {
> +			extent_err(leaf, slot,
> +				   "tree block info overflows extent item, ptr %lu info size %zu end %lu",
> +				   ptr, sizeof(*info), end);
> +			return -EUCLEAN;
> +		}
>   		info = (struct btrfs_tree_block_info *)ptr;
>   		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
>   			extent_err(leaf, slot,

