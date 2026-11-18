Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007991;
	b=XkY68O/WLalDEcJ1osFQVkajh/QnDtc2zz07sBckFMbO6vEVtp9UkLU/8cS+UUkAggKs
	 E3CWg2amMAnWsG0psA4XR3YhLXR7d9qWHOAR5ME9OkA5YOQRFrX+Jdp5+ncJCtD7Im9Sw
	 3zi+D5ISS9gB8+K5eJ6Xr8+WUBz5cgsXzcFnHJM/YJHTWE+aGLAvB7s/3jJK7AzDyUGs0
	 GJsbSUGSMGu5Vp+sfNCiTJldW3f8PXck/j1BoWxaZMzDwf3i9GtO3QOkClMMLU6++cOIW
	 CcWvl7JjXgu9Bj70zhqoqvbDjP3sH9IeD4A5qj31cREu7uLo1QDzk5bCN2HTQUn+A/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=93Uj5YlJiJDUPqQt02zfaVf+8qWZByKLyR/rRwtPCWI=;
	b=u46jPTlonBsOgq0mWlcl7vZU+A2OrZCBqjkXiNGV40i0CEkd3vr5yXRqUYOO59zSvUve
	 K5GccrZjIaWveD1iio57VBbvIoxGU4nRbxWdWakJx6HN4Pe7o1kMNQS/WA+0e+1jujG42
	 JHZgNpv0dKLi3SPWKN9SNI/EfXJ4bP3Lu0KWLqOGzGktnOnVzUcfqBvFcbDdSe6rCTzl9
	 aKyFak0hPweIz0TqdedqAuMaHZlKRLJz0tPUS5y95JLTIqCFQyUpus+LLZVrdtN/pz00G
	 xcLhUKWugFd3p8qqexWzA1bIJqVpn+a78/5dvk94btUTFUf+PFI2kBR0GcSRsxuwGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y434dVE3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y434dVE3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso10929525e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795007988; x=1795612788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93Uj5YlJiJDUPqQt02zfaVf+8qWZByKLyR/rRwtPCWI=;
        b=Y434dVE3SaNsU7j3zoVT/FqTeXOB/+iRps4Z3i9BHLEz16vp4YjcfNzKf32fOzWv6f
         eLeYkeG+4gEEPYjS6PldWx89jyh9HDErDo8HeM57clCniLe+MUlN5PYZUcmrAMa1v7Jc
         7Oy/U84NreNYGujiplHDk9Bhhah6+efymLH5FPBDDSbHDpa/Qky5dUma5aQVNdLmPbZs
         r1Ele7NPgsy+GCRTfiKLfXMMnzImTDu+3f+KqygFKUNnAmXddHBR1ABUOf2/yafZTvpm
         OuLWQSFfEst3Df1lwW9Mr7dKwtErIsHGLO6zoijeYaDK/eN++wMmx3Wbhb5MKaUEUlnf
         zxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007988; x=1795612788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93Uj5YlJiJDUPqQt02zfaVf+8qWZByKLyR/rRwtPCWI=;
        b=sLXnXkIBOUL/og7/bDl07p4J/ApdVL9TvlTgmhkrGzxHzulOK/08I4j1BLqV1uCKim
         Co++DocytcKAJt4amRVlfgnGpl+Vz4qUtMhIBJW7JwNlp5SiYxZ0wLPiyg5g1aBT49pW
         JNv6t1QwdDgrYaURE/KtWmbddrmg/DX/8iSLBJKi8dc3WC4SpIwO+u++05RW9/+hvEF1
         gqdTHTGdx3TjrmcuPfT8SvRA84YP3qIH5Zs1bxVhp118/QG5DTPAYyRk3sI8yWlqeT3I
         077nXAVyQvZR1l91lpiRTePhxYIBBySc22IPt0on2cVoR/+B5O6z81LkPtf8Witt09/j
         qNKw==
X-Forwarded-Encrypted: i=1; AL+hErGCjm04tXVSJ18kTANdSZWcQe4h/Eail46rdsb3imeOfYvWLSsgXbKHMeN7AnQoXKp3aPea/U5dwFAK94I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gIoFr+8DCmDcQQ0Vy0NqABUQcTDgtKKYyAvP5P7W0KaZSBwBr
	Pv75IsMETod/ce6RW7QeQUxE/JgT+uaG2yzqWdS7srAVE+WT1OfevfL9s0qTpr7vU0g=
X-Gm-Gg: AYBFou3OUS/g85z770O3zVX1Xp6fPhBl5yYhS2ZJlR//7IgxC/MjTCEXlAUYHbS44tS
	fBTPBgKbHPjvk5QVJv7ur/vjySrI40LyI/WdUsOsU74MuLWY5wooZsRlCPQayuBZDe6iMFrwsud
	nmxgSWrOpZtjs0LAole4+6Qu+BwBd6z1pSAL59rziR698fBt8tUCo8vHaTWh4HFWYPctjTn3OUa
	JjgCSdHLQnz9+40u1p27u6dr6PMbIoZhySGtqbWYaUIiLvxRGfL1r1dZTgUophFQm4L5YPM7Tdd
	3QoWa1KiggLBYioWL4ZRtzCHVPdNokhqa3LAFFZTFRT4b8nnKEUk41tMkRtGogZrIu7qVt8T3We
	vKGE17/lkQMEYpsuSmnzhndLzc8zKhxcByQaZAMJifFnZJLHCrBXUu4ocsZ4RDVa3fNAiFAPXCl
	r5PMrZ71DxblVIyM1WdCGGpYLX8IaPGwBqzMcLXP5U3/zauNJXXNjQ+aGCBetgSPWpwBxFQTD0e
	WYU+uAnm7HwWZITI30xpUPaZoKB8ozfBDOYMvlp7+2IQyuy0ZPXiOKT5U/IOTBZUqY7jiR2I/cU
	uQsNkJsNNGk0tU9NR1pen2QM1lD3DXUCLjgXchfFdq6YwKaAtqIchzA+wIXkL7TBEA==
X-Received: by 2002:a05:600c:1f82:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb7da4f53fmr49945395e9.26.1795007988353;
        Wed, 18 Nov 2026 05:19:48 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm156191165e9.4.2026.11.18.05.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:19:48 -0800 (PST)
Message-ID: <59295e13-8324-4749-9e0d-e018b78ae2d7@suse.com>
Date: Wed, 18 Nov 2026 14:19:47 +0100
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
Subject: Re: [PATCH v2] module: Add LZ4 module compression
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261115120416.256087-1-pmenzel@molgen.mpg.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261115120416.256087-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 1:04 PM, Paul Menzel wrote:
> XZ modules are small but slow to decompress in the kernel. Therefore,
> support modules compressed in the LZ4 frame format (.ko.lz4), as written
> by lz4(1). Decode block by block into a scratch buffer and copy into the
> module pages. Linked blocks keep the last 64 KiB of output in front of
> the scratch buffer as the dictionary. Verify the header checksum, block
> checksums, content checksum and content size when the frame has them.
> Frames with a dictionary ID are rejected.
> 
> modules_install uses `lz4 -12 -B4 -BD`: 64 KiB linked blocks are as
> small as 4 MiB blocks (i915.ko: 3587140 vs 3585364 bytes) and keep the
> scratch buffer at 128 KiB.
> 
> Userspace needs kmod with LZ4 support for depmod and modprobe [1].
> 
> On a Dell XPS 13 9310 with an Intel Core i7-1165G7 (Tiger Lake) and an
> NVMe SSD, decompressing and checking the signatures of the 237 modules
> loaded during boot takes 624 ms of CPU time with XZ (i915: 91 ms) and
> 131 ms with LZ4 (i915: 12 ms), measured by calling finit_module() again
> for each loaded module. The LZ4 modules take 20.3 MB instead of 11.0 MB.
> Both kernels are v7.4-rc1 with the same patches, including pending
> lib/xz decoder speed-ups. Ten alternating boots of each kernel:
> 
>   | ms (median)                               |  XZ  | LZ4  | change |
>   +-------------------------------------------+------+------+--------+
>   | early-i915 (modprobe i915 + dependencies) |  295 |   90 |   -205 |
>   | first i915 message                        |  738 |  547 |   -192 |
>   | GDM autologin                             |  973 |  876 |    -96 |
>   | GRUB start to autologin                   | 1292 | 1197 |    -94 |
> 
> QEMU 11.1.2 (KVM, AMD EPYC 7763, 8 vCPUs, module.sig_enforce=1, 10
> rounds), loading the same 237 modules in dependency order:
> 
>   | median                   |   XZ    |   LZ4   | uncompressed |
>   +--------------------------+---------+---------+--------------+
>   | one at a time            | 2082 ms | 1499 ms |      1461 ms |
>   | 8 in parallel, like udev |  619 ms |  573 ms |       593 ms |
> 
> Link: https://github.com/kmod-project/kmod/pull/505 [1]
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Which Linux distributions are interested in LZ4 compression for modules
and plan to use this feature?

> diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
> index cce098671be97..028b411015f21 100644
> --- a/kernel/module/decompress.c
> +++ b/kernel/module/decompress.c
> @@ -287,6 +287,249 @@ static ssize_t module_zstd_decompress(struct load_info *info,
>  	kvfree(wksp);
>  	return retval;
>  }
> +#elif defined(CONFIG_MODULE_COMPRESS_LZ4)
> +#include <linux/bitfield.h>
> +#include <linux/lz4.h>
> +#include <linux/sizes.h>
> +#include <linux/unaligned.h>
> +#include <linux/xxhash.h>
> +#define MODULE_COMPRESSION	lz4
> +#define MODULE_DECOMPRESS_FN	module_lz4_decompress
> +
> +/*
> + * Decoder for the LZ4 frame format written by lz4(1), see
> + * https://github.com/lz4/lz4/blob/dev/doc/lz4_Frame_format.md
> + *
> + * Each block is decoded into a scratch buffer and copied into the module
> + * pages. A linked block may reference up to 64 KiB of the output before
> + * it, so that much output is kept in front of the scratch buffer.
> + */
> +#define LZ4F_MAGIC		0x184d2204
> +
> +/* Frame descriptor, FLG byte */
> +#define LZ4F_FLG_VERSION	GENMASK(7, 6)
> +#define LZ4F_FLG_BLOCK_INDEP	BIT(5)
> +#define LZ4F_FLG_BLOCK_CSUM	BIT(4)
> +#define LZ4F_FLG_CONTENT_SIZE	BIT(3)
> +#define LZ4F_FLG_CONTENT_CSUM	BIT(2)
> +#define LZ4F_FLG_RESERVED	BIT(1)
> +#define LZ4F_FLG_DICT_ID	BIT(0)
> +
> +/* Frame descriptor, BD byte */
> +#define LZ4F_BD_BLOCK_MAXSIZE	GENMASK(6, 4)
> +#define LZ4F_BD_RESERVED	(BIT(7) | GENMASK(3, 0))
> +
> +/* Block size field: the top bit marks a block stored uncompressed */
> +#define LZ4F_BLOCK_UNCOMPRESSED	BIT(31)
> +
> +#define LZ4F_WINDOW_SIZE	SZ_64K
> +
> +/* Block maximum sizes for the BD byte's Block MaxSize values 4 to 7 */
> +static const u32 lz4f_block_max[] = { SZ_64K, SZ_256K, SZ_1M, SZ_4M };
> +
> +static int module_lz4_copy_out(struct load_info *info, const u8 *src,
> +			       size_t len, size_t *total)
> +{
> +	while (len) {
> +		size_t offset = *total % PAGE_SIZE;
> +		size_t chunk = min_t(size_t, len, PAGE_SIZE - offset);
> +		struct page *page;
> +
> +		if (offset)
> +			page = info->pages[info->used_pages - 1];
> +		else
> +			page = module_get_next_page(info);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +
> +		memcpy_to_page(page, offset, src, chunk);
> +		src += chunk;
> +		len -= chunk;
> +		*total += chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int module_lz4_verify_content(struct load_info *info, size_t total,
> +				     u32 expected)
> +{
> +	void *data;
> +	u32 csum;
> +
> +	data = vmap(info->pages, info->used_pages, VM_MAP, PAGE_KERNEL_RO);
> +	if (!data)
> +		return -ENOMEM;
> +	csum = xxh32(data, total, 0);
> +	vunmap(data);
> +
> +	if (csum != expected) {
> +		pr_err("LZ4-compressed data is corrupt (content checksum)\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t module_lz4_decompress(struct load_info *info,
> +				     const void *buf, size_t size)
> +{
> +	const u8 *in = buf, *end = in + size, *desc;
> +	size_t block_max, total = 0, dict_len = 0;
> +	u64 content_size = 0;
> +	u8 *scratch, *out;
> +	bool linked;
> +	u8 flg, bd;
> +	ssize_t retval;
> +
> +	if (size < 7 || get_unaligned_le32(in) != LZ4F_MAGIC) {
> +		pr_err("not an lz4 compressed module\n");
> +		return -EINVAL;
> +	}
> +
> +	desc = in + 4;
> +	flg = desc[0];
> +	bd = desc[1];
> +	in = desc + 2;
> +	if (FIELD_GET(LZ4F_FLG_VERSION, flg) != 1 ||
> +	    (flg & LZ4F_FLG_RESERVED) || (bd & LZ4F_BD_RESERVED) ||
> +	    FIELD_GET(LZ4F_BD_BLOCK_MAXSIZE, bd) < 4) {
> +		pr_err("LZ4-compressed data has an unsupported frame descriptor\n");
> +		return -EINVAL;
> +	}
> +	if (flg & LZ4F_FLG_DICT_ID) {
> +		pr_err("LZ4-compressed data needs a dictionary\n");
> +		return -EINVAL;
> +	}
> +	if (flg & LZ4F_FLG_CONTENT_SIZE) {
> +		if (end - in < 8)
> +			goto truncated_header;
> +		content_size = get_unaligned_le64(in);
> +		in += 8;
> +	}
> +	if (end - in < 1)
> +		goto truncated_header;
> +	if (*in != ((xxh32(desc, in - desc, 0) >> 8) & 0xff)) {
> +		pr_err("LZ4-compressed data has a corrupt frame descriptor\n");
> +		return -EINVAL;
> +	}
> +	in++;
> +
> +	block_max = lz4f_block_max[FIELD_GET(LZ4F_BD_BLOCK_MAXSIZE, bd) - 4];
> +	linked = !(flg & LZ4F_FLG_BLOCK_INDEP);
> +
> +	scratch = kvmalloc((linked ? LZ4F_WINDOW_SIZE : 0) + block_max,
> +			   GFP_KERNEL);
> +	if (!scratch)
> +		return -ENOMEM;
> +	out = scratch + (linked ? LZ4F_WINDOW_SIZE : 0);
> +
> +	for (;;) {
> +		u32 block_size;
> +		size_t len;
> +		int ret;
> +
> +		if (end - in < 4)
> +			goto truncated;
> +		block_size = get_unaligned_le32(in);
> +		in += 4;
> +		if (!block_size)
> +			break;
> +
> +		len = block_size & ~LZ4F_BLOCK_UNCOMPRESSED;
> +		if (len > block_max) {
> +			pr_err("LZ4-compressed data has an oversized block\n");
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +		if ((size_t)(end - in) < len +
> +		    (flg & LZ4F_FLG_BLOCK_CSUM ? 4 : 0))
> +			goto truncated;
> +
> +		if ((flg & LZ4F_FLG_BLOCK_CSUM) &&
> +		    xxh32(in, len, 0) != get_unaligned_le32(in + len)) {
> +			pr_err("LZ4-compressed data is corrupt (block checksum)\n");
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (block_size & LZ4F_BLOCK_UNCOMPRESSED) {
> +			memcpy(out, in, len);
> +			ret = len;
> +		} else if (linked) {
> +			ret = LZ4_decompress_safe_usingDict(in, out, len,
> +							    block_max,
> +							    out - dict_len,
> +							    dict_len);
> +		} else {
> +			ret = LZ4_decompress_safe(in, out, len, block_max);
> +		}
> +		if (ret < 0) {
> +			pr_err("LZ4-decompression failed\n");
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +
> +		retval = module_lz4_copy_out(info, out, ret, &total);
> +		if (retval)
> +			goto out;
> +
> +		if (linked) {
> +			/* Keep the last 64 KiB as the next block's dictionary. */
> +			size_t keep = min_t(size_t, dict_len + ret,
> +					    LZ4F_WINDOW_SIZE);
> +
> +			memmove(out - keep, out + ret - keep, keep);
> +			dict_len = keep;
> +		}
> +
> +		in += len;
> +		if (flg & LZ4F_FLG_BLOCK_CSUM)
> +			in += 4;
> +	}
> +
> +	if (!total) {
> +		pr_err("LZ4-compressed module is empty\n");
> +		retval = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (flg & LZ4F_FLG_CONTENT_CSUM) {
> +		if (end - in < 4)
> +			goto truncated;
> +		retval = module_lz4_verify_content(info, total,
> +						   get_unaligned_le32(in));
> +		if (retval)
> +			goto out;
> +		in += 4;
> +	}
> +
> +	if (in != end) {
> +		pr_err("LZ4-compressed module has trailing data\n");
> +		retval = -EINVAL;
> +		goto out;
> +	}
> +
> +	if ((flg & LZ4F_FLG_CONTENT_SIZE) && content_size != total) {
> +		pr_err("LZ4-compressed data has a wrong content size\n");
> +		retval = -EINVAL;
> +		goto out;
> +	}
> +
> +	retval = total;
> +	goto out;
> +
> +truncated:
> +	pr_err("LZ4-compressed data is truncated\n");
> +	retval = -EINVAL;
> +out:
> +	kvfree(scratch);
> +	return retval;
> +
> +truncated_header:
> +	pr_err("LZ4-compressed data is truncated\n");
> +	return -EINVAL;
> +}
>  #else
>  #error "Unexpected configuration for CONFIG_MODULE_DECOMPRESS"
>  #endif

I think the module loader shouldn't implement an LZ4 frame decoder
itself. I'd expect that functionality to be provided by lib/lz4/ and the
module loader should only be a user of it.

The LZ4 block format implementation in lib/lz4/ is derived from the
original LZ4 code. Have you considered similarly adapting the original
LZ4 frame decoder instead of writing a new one?

-- 
Thanks,
Petr
