Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638322;
	b=D3Gqe6yCSGpx/ZhB9y1hhamrHf3iLcMV/8oNAnGO8BmhD6sO5dQxD6lcRL60f7UAS3HX
	 oAdpyL5AZr9pKrgqwr7GVKcGqoL5NuiqgVI0odoDcyEjffqQRk8IndRDy+PBKtpFNoqSL
	 ybpjGXQ8D3iO8Lr8OBbbLhxR1ZOaCIapxMtu0rkNXOwXSulGOOBPupaLYqF48c646bHJV
	 eeZW93CPuVGQ6F9p4C6NARXUM0xVh7MVswRDY+/kcS96jM0DLOW/qcgSIZAoq8zV3aVqK
	 FW7VqqwYdDuu0FOEfd92H/BEW+SOOzgoH1I2vrLtrBiadUehcFBvNeCa6qlZSpn/9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qUfXZUKB9DaQS8RU9ovVyj3jZEh0TkP6nnfuX7AkYik=;
	b=pqcovEZEGWrqs4tJMQA1zg5Sh2Col/MvrO9ynAdaHSgx1URjleXtCPOmqZQxnm558enR
	 kHGHtWw3BiqDzhaP2imXJEVbswPFrvY66zYWengie0sxcFh0SMjNqo8qxJ8a+n4XjZOuu
	 qZJSHvakzdUrdRZElNaHkFFJ6RW5Z/IwPEYwWdOfn3Cr0Y7PVPh5Qp0RuUEmlgyrjevq/
	 z3aWeuduAmJDnGeAOK/z8dJ6VeDBuxeiIpFPqcNazNxu/Mx8ZRlErADMizQXhre94fM92
	 Syp1TIwFxuEAl4PdsrornQkW68sFiLOSZatmNk6AH7N7XW/WHUAgatfiNOYLsXxdnFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E1va+KSN;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D060A261D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41D060A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E1va+KSN
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c51a02ad3acso190302066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795638320; x=1796243120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUfXZUKB9DaQS8RU9ovVyj3jZEh0TkP6nnfuX7AkYik=;
        b=E1va+KSNKKkn6t93wf/F9iK6uk8Sw2FoIfX5uW/fke9i5jnoBjp1i5gSQ5iONOcRSL
         g/ons4FP49O1gi+SWsFXSsZI0XyhSSShBgQ4bfLsIn8yQ+dNT6TySuvxcGU724djrVS7
         7aTrogquiI3z57+ZnkXIIRRZT8EZGUsL3WqVhj1xMLyaxRg8nNNgkyshO9vItuf+cjdD
         KV1KZSlKJT13FB6bd42hkQXXpdas7WTSKFi3Vm252cZ+UJKTreyY5/1xHEOOUrhPVZfB
         RbxhfPHcpTUnkdrK9p0qmn276LQv52D2SkRms7/585kVln1KSTVkQUMM5/mq0OU4+Eyj
         LcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638320; x=1796243120;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUfXZUKB9DaQS8RU9ovVyj3jZEh0TkP6nnfuX7AkYik=;
        b=tpa+lSclQgZekqWGllhzLlhBZziC6ke/AxI0ADFdi2RBCTJiYUZ/PczeDDNv176mj+
         53TtgK5jJ0XRO03JbkAYo2i5vFzMymrqIFaTOiSByz30Hl0x3KuP9swq3/YKfDS810Xx
         DbrC4m7ulIcCzbJDAO7FTeZzd1Ov+s4+5E4Adgy2f9rsggJHzTl59yS+SXVY2fTXFXvt
         nktvUiEX2/gdBehMzv8phqXsomJXix6C899njuuclgop3D4Su+Ffsi/ACXs0XS6NXjs4
         vA9qk4J9UsWGAM8VDp7KQWy1JDbhLDa3QN9WQjPXa2mNrtZfPPxwOOsaqcDqLl5GqcKE
         iHuw==
X-Forwarded-Encrypted: i=1; AL+hErH3iUIC05NMf4zZn+GwHO+QxBxh99afMAUWDAUa+e8rjGHpRzLWy2fpjKEgksKPwRo91NFGBiD03R6P8lU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++4HzvoqwmiXrCilCZ2D6aHG8qE5/mCfQ1sxeSsvUsnIOV2SrF
	45xR61wLtlsM54T6bHB9AK+tc6tik6hS2UGgbefFH6Ef3Z961hOquX6sYJnjRQtTIxc=
X-Gm-Gg: AZFdTZcbdl0q30Fep66l77yHXmijDo7Zo5QRWrJWy1Fo1d06Z+uJ0kzzCmsoUiPWSrr
	YG+7+yvf9mcMS65DZl6p69/yPWjBAbrhusZSoPXuIO/lDP9a3qKaGQ0LFAYpEJt3cHxc1oevFbQ
	ecb9NVWvuO3rHC9ZS4xei5EDXTtuzh93lpUlbZmp4x1TFUYD4LXCRqm1Xq/0u7lmgls70JHs8If
	J1S2d6p/tkVyigLDpZEHnMqaivPwH+6Np1CLZqO0D4nN52ZHWu0F2dY4V8D6GhlUd/uPn2elnev
	CR4WVUQ6DnVxn7qIOPtxk303Ey0lbid3aERsVjJOO6LlSLJ3gqnD9o5bs0IzEnvFwDH1MRJ72aJ
	xZ1ayjuz4IQPXFBKeiR4/YlvlJopJFfAxPqfZ7M4ZrybPpF4bAZA4ndONgR2weWCUpIwll0MWlw
	zBMZO/RMOuYUnpUzsNV96G6DFwspjzkugz1VsDEgMr6y3gifWbTDpa1y3ZFP170he8KrerfCZvd
	grZju6VHgv61LYNJF0R7pLjZWaWCHLwj0azIOITe+3YYuCl/Yb2o0d0JfPigRf43kAa6xsGMFXp
	f63pQmIu/45GR4Yp7I7vbUTPeOInntKzMKCecT9M6ho=
X-Received: by 2002:a17:906:eb15:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c513a5ed086mr1183615566b.11.1795638320234;
        Wed, 25 Nov 2026 12:25:20 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm31638840a91.6.2026.11.25.12.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:25:19 -0800 (PST)
Message-ID: <a9a42697-2d63-4382-b66d-a87950af6289@suse.com>
Date: Thu, 26 Nov 2026 06:55:14 +1030
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
Subject: Re: [PATCH] btrfs: remove "rescue=usebackuproot" from "rescue=all"
 shortcut
To: Hengyu Liang <hengyul@cs.unc.edu>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-btrfs@vger.kernel.org
Cc: Boris Burkov <boris@bur.io>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, linux-kernel@vger.kernel.org
References: <20261117030353.1738805-1-hengyul@cs.unc.edu>
 <9155e9f6-9d76-43b3-bd20-a4c98a9f2c84@gmx.com>
 <20261125171741.3518473-1-hengyul@cs.unc.edu>
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
In-Reply-To: <20261125171741.3518473-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/26 03:47, Hengyu Liang 写道:
> Hi Qu,
> 
> I found this while comparing the behaviour of different kernel versions.
> I used an LLM to analyse the problem and to draft the patch and this
> message, and I analyzed the result myself.

Then you should also stop waste human time on reading such long word salads.

> 
> On 2026/11/17 14:53, Qu Wenruo wrote:
>> Furthermore, one can even argue that this behavior gives a higher chance
>> to mount the fs.
>>
>> Thus counting this as a bug is very weak argument, thus the whole point
>> of your patch may not even stand.
> 
> I agree that slot 1 helps when the newest tree root is damaged. But
> "rescue=all" is also what people use to copy data off after an unclean
> shutdown, and there slot 1 can be worse than the newest roots:
> 
> 1. The data extents freed by the last committed transaction can already
>     hold data of the transaction that did not commit,

That's not a problem, COW makes sure the old data can still be reached.

> while slot 1 still
>     points to them, and ignoredatacsums reads them without an error. In
>     my test, user A deleted 30 of 60 files in the last transaction, then
>     user B wrote and fsynced 60 private (0600) files before a power cut
>     (I used a copy of the disk taken at that point).

And fsync is a different behavior. Fsynced data are only in log tree.
No matter if you use the newest slot or not, as long as you ignore the 
log tree, those new deletion will not be seen anyway.

> With
>     "ro,rescue=all", A's deleted files are back, and 30 of A's files,
>     owned by A, contain B's data. Copying the data off with the owners
>     kept hands B's data to A. With the newest roots (v7.3, or
>     "rescue=all,rescue=usebackuproot_0" now), A sees only the 30 current
>     files with A's own data.
> 
> 2. On the same disk, "ro,rescue=usebackuproot" fails with "chunk ...
>     has missing dev extent" (-EUCLEAN), while the newest roots mount
>     without errors. I also have a syzkaller image that mounts with
>     ignorebadroots and usebackuproot (plus some unrelated options) on
>     the parent of c73eb6f72741 and fails with -EIO on that commit: slot 1
>     has a bad checksum,

That's the problem, and users always have the solution to choose which 
slot to use.

> the newest roots load. So slot 1 does not always
>     give a better chance to mount.
> 
> I have two suggestions, but in the end it is your call:
> 
> a) "rescue=all" tries the newest roots first and falls back to slot 1
>     only when the mount fails with them (similar to the retry Boris
>     suggested in his review of your series).
> 
> b) Keep slot 1 for "rescue=all", and document in btrfs-progs that an
>     older slot can point to reused data blocks, which ignoredatacsums
>     then reads without errors.

Nope, not for slot 1 at least.

Data COW ensures it won't write data into an extent just released in the 
current transaction.

> 
> Thanks,
> Hengyu

