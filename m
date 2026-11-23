Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465978;
	b=EaXaxbODwclX3B7mFPz2GqshOFFEeQkXzPCwdcSwWbg1bfPCI33FOyZMT8n8TCuTO9Fy
	 9di3E2zHob1k4mcGW6f7T2b9WOhT4sIa1IU7SI54ciPLGJd+DIbHsAh1OzpfBf7Dcqb82
	 7BJuJbMEoO/epI10uiPUbP/KmynKFf4cmwBEfc8fj3qSx2DWBxUe03+PkIn3fCEhXPHsV
	 dRUhihJTeprJMxxWNB09lffTnJAe/MbNQolprv9mW6/2t1wDMOsmGrwtIs00ay+Sp7xZ+
	 MQpWLqyASW7cMnaotzNsRCEG9+McJa1z1j4HDhp3PlyHqaNk4FFcoq8eNzl6RjxikRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YzUbmrAMNaDNbA0a0BO2wV4Q46/t1fDcpkzGmt+WP4s=;
	b=gNrks5OihuVCayzdhx30sf6vonkJjAZ4OT8ADV6uierPAlYvxsgO5RPmvmQ23F3lvX5b
	 UYHZUjGLg/9YV/q9GNDqg89ZMIA//MwzJeurZo1anUUKg5+poTRKUzeh4k3RbOzHfg8U0
	 VLmIUOoTEd1GpIcOPY8mhtdTkO8sKGaaCNFt5DcNWQPbhdnoNmHC1R6j1A5emk2FjAyt3
	 ady5ktN8pbgkuTr5ea2im0xA5HxgAEFBR1G7qJmFmuL2lB079OftwmJ9ZheAbdCdsHL/L
	 6zWy29efRfartSQNAUEfHNsl4FB/LUgnxxyevwU6nKZnRPMBI8muHNYr4x/dOGFLPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cljheMUs;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580EE606A6A4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580EE606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cljheMUs
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so4250990a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795465976; x=1796070776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzUbmrAMNaDNbA0a0BO2wV4Q46/t1fDcpkzGmt+WP4s=;
        b=cljheMUsDXJMtHI1yx2+6Kqo8cfRH6LdsFAiV+YsLrcTHueumV0C54P6HTKnaklCt5
         B8YTFU2zS06Bln+znAN0yOs6JF9tmqtl3TkSMZ5HpBKl3C8/jK0jyA8ZiJfpnqgdJuXl
         wxn714sbzv0w0j8ac01GmS5ugSxwcoBGgUeW+oanlz4/Racf9KpBf9lssOcH7AYvxZBf
         ipia0wg4D61DOMRGzQDZrfbkn+hQg/3oKtgc78Z/HQe/e1j/daOA0AgwVo9PpDFXpYVH
         /w0xZngcTCO1bOU5NW7dBRKQbcLmmySVUqp6IIGkGJzA9p8pOrs3TTMGPc4T05VbtrdS
         Ai2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465976; x=1796070776;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzUbmrAMNaDNbA0a0BO2wV4Q46/t1fDcpkzGmt+WP4s=;
        b=RFCZ3k7D4rcHu/J1JA7RuaKWmF7Evo3JjY3FUCy+4zNAf9ZIgIRbYX/KHSM8bSulak
         LiTo5iPvTfH4AIVg9WCIUW6musBsKSOeOpk7uiE9uLB9h5MPrBHhpeCMx1B3Svy5n4/N
         1n0iqtYb53D119m8HSdcjN6C0pn789n0hmPM+xhn31gnxrIAV8I3U6MTdxqKGcHXVvkq
         OvW5+VWBDg3DmXe31eDUVX/nIreFt2KbTcgR2jNKapUWqr3hAShqnXMQp/ZtuG974Nei
         8P4iwoABiqc2oDIoFaiWJ65Nmwq0pOXPwxPjLb2aiBJeBNaaWB6Kj0z+C3hFgDjGWL6K
         iBXw==
X-Forwarded-Encrypted: i=1; AL+hErG4oL/620kfGS++JlZAFDitJka1mR0xIbEclq720Gns054Ce18q0AaF3BDtRivuVijTDeIH4fuJPCn8pxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D3RA81GPQkncBbN64frPNA0dTXVaKuW+I6L4pjWofQTU8R5+9
	bC8rBH+Xh+trVrkwrsXOlqmgE8RkPJW2OrupkLhL5gsGpLn+gnJyuEDSKGXL3JA5h88=
X-Gm-Gg: AZFdTZcNuv47lQ1bzevUTu8tDwTMbxWKR+3B3AYU0EkTFY5w9mcvTvHt8oRqu3vMqO6
	UgL+fHdKArFvbpLKbpNWfzT6vSZl/b1ymCsMTche0GmuxM30WjZmyAiVtkoU+OSiJP2LfmF4P1V
	bewjrPvaeLV5PCz3lwy+dUZnNjxCOjQ1XxTSR7GRY3ai9zRfdgDdlAVabVF7Erh3Xx5HFnulDOQ
	ICiyQriTVZGrmpwlX0fT+EfUXRF4sX9FCgrIaBX5XS5bmI846oQEGpjPkiIcfh9scUyfNGRkf5D
	QENnIjMb5n0Q3yU/D13dBoA1A0fQUDDEIfuSu5QaOrUeGFx0Nb9bQJxJ57AwsEOiGH5diIyodS1
	GqMAk7HeILX5IbKtXBrOsTqu6fswsjMtcUgePri93sDSF3LA4/tFLuKZs5DJHHsf8jRjGIi9Kbv
	QR3SkPxjLbnoyW0T/NbfojbJsYPRycEu8D/qLlgz6oXnzy7CXWpkpD/hef4jaTi8LnjOSErNXIc
	ozb5dpk0yh8XVOKF8GZtQXx9f96UPlOENs3ZD9oUpEZ2bUe+uNtQ2f7s2I5gVxadqpGz0p232vn
	GcCoL63pRtyZmk1cZcrEuw==
X-Received: by 2002:a05:6402:210e:b0:6b8:50e:3bb0 with SMTP id 4fb4d7f45d1cf-6ba37ec6490mr9475676a12.43.1795465975598;
        Mon, 23 Nov 2026 12:32:55 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm19329882a91.11.2026.11.23.12.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:32:53 -0800 (PST)
Message-ID: <6887e526-a0ba-414e-a44c-0e7b861192b4@suse.com>
Date: Tue, 24 Nov 2026 07:02:47 +1030
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
Subject: Re: [PATCH] btrfs: fix NULL end_io call when submitting a repair read
 fails
To: Miroslav Cimerman <mc@raidlab.org>, linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org
References: <20261123175633.2058431-1-mc@raidlab.org>
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
In-Reply-To: <20261123175633.2058431-1-mc@raidlab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/24 04:26, Miroslav Cimerman 写道:
> repair_one_sector() sets up the repair bio without an end_io callback.
> Its completion does not need one. btrfs_check_read_bio() recognizes a
> repair bio by its bio_set and hands it to btrfs_end_repair_bio().
> 
> btrfs_submit_chunk() can fail before the bio reaches a device, when
> btrfs_map_block() or btrfs_lookup_bio_sums() returns an error. It then
> ends the bio with btrfs_bio_end_io(), which calls bbio->end_io. For a
> repair bio, that is a NULL pointer:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000000
>    Workqueue: btrfs-endio simple_end_io_work
>    RIP: 0010:0x0
>    Call Trace:
>     btrfs_submit_bbio+0xf1a/0x20f0
>     btrfs_check_read_bio+0x758/0x12e0
>     process_one_work+0x68d/0xf30
> 
> btrfs_bio_end_io(), btrfs_submit_chunk() and repair_one_sector() have
> no frame of their own in the trace.
> 
> This can happen on the first submission in repair_one_sector() and on
> the submission to the next mirror in btrfs_end_repair_bio(). On the raid
> stripe tree, the mapping can fail for one mirror only.
> btrfs_get_raid_extent_offset() returns -ENODATA when the stripe extent
> does not list the device of that mirror.
> 
> Complete a repair bio that fails in btrfs_submit_chunk() like a failed
> read of its mirror, from the end I/O workqueue. A read to a missing
> device completes the same way. The repair code then tries the next
> mirror, or fails the read when no mirror is left.
> btrfs_end_repair_bio() needs the mirror number and the saved iterator.
> A submission that fails in btrfs_map_block() sets neither, so set both.
> Each retry runs as a new work item, so the retries do not nest.
> 
> A mirror whose submission failed counts as a bad mirror. When a later
> mirror returns good data, btrfs_repair_bbio_failure() runs for that
> mirror too. On a zoned file system, it starts a relocation of the block
> group. Otherwise, it writes the good data to that mirror. This write
> does not use the raid stripe tree, so it does not add a missing stripe.
> After a transient error like -ENOMEM, it rewrites a good mirror.
> 
> Fixes: 7609afac6775 ("btrfs: handle checksum validation and repair at the storage layer")
> CC: stable@vger.kernel.org # 6.6+
> Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
> ---
> Found with FuzzyRAID, a fault-injection tester for RAID that is not
> public at the moment: a repair read whose mapping failed, on zoned
> RAID1.
> 
> The tests use a test-only injection that fails the mapping of repair
> reads in btrfs_submit_chunk(). The file systems had bad blocks on the
> data of one device, and reads went to that device. Without this patch,
> the first failed repair read crashed the kernel in 5 of 5 runs: 3 on
> RAID1C3, 1 on RAID10 and 1 on RAID6.
> 
> With this patch and the mapping failing for the first mirror each repair
> read tries, RAID1C3 and RAID6 read all data from another mirror, in
> 2 of 2 runs each. RAID1 has no third copy, and its reads returned -EIO
> (1 run). With the mapping failing for every mirror, RAID1C3 and RAID6
> returned -EIO too (1 run each). None of the 13 runs with this patch and
> the injection switched on crashed or hung. 4 of them also had Josef's
> patch below. Without the injection, both kernels read all data from
> another copy. The btrfs_lookup_bio_sums() failure path is not tested.
> 
> RAID10 needs "btrfs: don't drop the error of the last split bio" from
> Josef's data integrity series for the -EIO. Without it, a read that
> spans both mirror pairs can return wrong data without an error. In
> the 2 RAID10 runs with this patch alone, sha1sum read 7 of 8 files
> without an error and got wrong data. That also happens without this
> patch when both copies are bad: in 2 of 2 runs, 522241 and 522210 of the
> 1048576 bytes of a file came back wrong. With both patches, the RAID10
> reads returned -EIO in both runs, one with the first mirror failing and
> one with every mirror failing.
> https://lore.kernel.org/linux-btrfs/20261120-b4-btrfs-data-integrity-v3-1-4de4b91b826e@toxicpanda.com/
> 
> Kernels before 6.19 need a backport: simple_end_io_work() is
> btrfs_end_bio_work() there, and 6.6 and 6.12 have no end_bbio label.
> Backports can follow if needed.
> 
> The analysis, the fix and the tests were done with the help of an LLM. I
> reviewed everything.
> 
>   fs/btrfs/bio.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
> index efbce4d549ff..46df424e9667 100644
> --- a/fs/btrfs/bio.c
> +++ b/fs/btrfs/bio.c
> @@ -840,6 +840,19 @@ static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
>   		btrfs_bio_end_io(remaining, status);
>   	}
>   end_bbio:
> +	/*
> +	 * A repair bio has no end_io callback. Complete it like a failed read
> +	 * of its mirror, from the end I/O workqueue. The repair code then tries
> +	 * the next mirror. A direct call would nest once per mirror.
> +	 */
> +	if (bbio->bio.bi_pool == &btrfs_repair_bioset) {
> +		bbio->mirror_num = mirror_num;
> +		bbio->saved_iter = bbio->bio.bi_iter;
> +		bbio->bio.bi_status = status;
> +		INIT_WORK(&bbio->end_io_work, simple_end_io_work);
> +		queue_work(btrfs_end_io_wq(fs_info, bio), &bbio->end_io_work);

This looks overkilled to me.

If the end_io is no-op, why not just define a no-op end_io for it?

> +		return true;
> +	}
>   	btrfs_bio_end_io(bbio, status);
>   	/* Do not submit another chunk */
>   	return true;
> 
> base-commit: 65101fe10b3008186b813b628ee3a611b0e70ce6

