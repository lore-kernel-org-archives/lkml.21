Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614906;
	b=UU37qgrgkjzZRPoQtBkM4XCj+/+V7pOUboJ7pQSpA3eWN+vFEV+plApApQ+G/dZuhlID
	 KUbl2HVmHiP61+XKlowJuIKlM5fxaFHzV371hhzehCMprqcBvLvAqmbn0s8NBpfhKlvxv
	 YADv4HIKVAnU+rPMqF9fnMc+aSEQSKGxFxrsoH3VoP+BhC/jR+oYh4L6G+JnCj7kyXrf4
	 33kTuCZCElsI0jgcHH0QEY5ICaqKYR/ic+6VMI6+CS3ZHZK9SwYS7Ck6rtlnh4e5i7ea2
	 +yg1LVXEqct+M2KaDgIYLF7frAlgmTwrf1b49Fs6UUv2mIHIJ0OYYHfUZhIt9l7jF/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
	b=LWlgZ8yzFJXGPVjLggcrGLWKYR7luKRqCeJKSeKZhgMTj4jhy0r3LFIWowEQTYpAj10V
	 LXqYMLFyn/L0QhRcVLyzoOJvaGIC7/bvZVxSw3f345n1Dd2sGNE6ECL4c6kVTDTx3c9jj
	 omgNAmCX4EqT1WDEOBY9zvXIUV73emSce+HOBSqWo+BNP5g5p7ZtmmGH00/JTTsw5v7ND
	 kyeIEaGF9wF3BIYZqlqF8p6Z90rxsb+BudOSSDCqhGy0uXWqtPPNx2A8u3DqSzSTgvpYU
	 2jy4fH+QQS8LfmUpVdJlS8tllYXA/hqEpQFTtv3Mgw1aAcXJaY0TW/1GzspekRrW4fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STitpKql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190A3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STitpKql
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so6986861a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614904; cv=none;
        d=google.com; s=arc-20260327;
        b=BTBFSYqtER7cse+/tvHNa4x5/HtSj/FVn0uBYtkYgPoWVK5VsnmLJCX/e8FMz0JTGG
         Wbkyu/oA5qk4CFA1wPeqQWb/34fz2/QjOY/wPHYT+4SBQlbIWNMYuqjzg72kt+ZTOFhK
         nOnNFMiSkONYiiVdy4nlJTm8NbvcZw6HxFz/2rGFpliFiSakbMymCa6XY99revDmq+DA
         a/vJYhuFzeXXC6iCXr+GaNgZVcM5MQiDEbrsx5Yov7sH7ryymGfyefqy37pFMgTjnGJS
         BXd6/LU51q5C+Bn9RPCHkxBO2aIzsc7I7qxaMlo7qXIrGl+JyX44REDxGDNbRT6YzsjV
         4nPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        fh=lrlGKT9qK2jJ0mi3ot3KkGKnSc2/72QmcSvw+FP3XQQ=;
        b=IeHyPXTdWlbLSyeF555TsW1HBEXWXI/hawXji1YPX4+NHiDM/ep30PnMI3I31WyN1M
         jZ8mVeHMNEAyVGfsu9hF7a30rPYOX4Pz3FqY7Z5ATXOYOyApohYHJot7FTKx5aJ+NxvW
         rVzn/xZSh2Ozuk/bVLwJVpZi8KT+IZ02/D6NGesKPq0MpkpuqNHL6x+fBok/asEc2IT8
         qEtHJBiXBN2WsKLDnU/KfT4wcsKPm78ZWVXOZgtRvBzc429T9chyv32PqwkB26ixkw7d
         Rd+4GjQr58mXudjI6r3KnA6BKAwxOtM5hlZuhHQWyp4pKSj5+qeuVtpxp5x2lk2tvQsk
         KXAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614904; x=1796219704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        b=STitpKql3+gSxRBbZFO+mxFfLYg6flkY9vu99KQo50PFn2zLcFCifP7FqvDrKVRYUX
         Ob+OefPHjb6KLCfeEYwK/dJEwpH++JpvoCioEKQ3TKLiZMz5crHri8CCeKjoviXZBBJp
         UY2AgAhzSb5NgUD4onubHisj+TQHlxLJsSnxkuQzR8FBzYIoI4OUqLqx57ms83XPoN/T
         icfPDHLSlGlRXIc+sRVpBUb7qd/UDh1UbNtHCNArhZZd3pMCAKroEyr6UDjscBnaakVY
         82FK4/JI3h8vxO8RsB2ADg6P4TWmlv4YqsAJ+HVV6GwGuGOhvPE6H+GFLAK4yWARRIgQ
         clYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614904; x=1796219704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYdSWZX6z3J81MBEprutofG6iM+0DzbiUdKjQNRWO2E=;
        b=TTjKG3uuqnDwzBRdjwMasN1JOMbEvxADc+NyK3+DKGQ+JNSWM2H2jf8GCqLT5bqAdb
         AlhB19ckXnth95dVzE88tTQ2qX4oskmMn087CPGwXxU99N8adDE6E8B0lMrATvz26OhY
         3pORlRrVXweB6mp1mb6KBHRko89mn3QV5IGzsS0zOT3JaCL7xGezx5Sdk6G3RpISSzUB
         jVxoLV9H8vpynqnBs5W35AiEOHZrB/ZAnHrZcfeUaInPXm9HgA10GQHTuHdLYE8lkLNP
         O3zELsbPBEOjGDzrIUDGH5r+3b0XE7or8OJgucyl6sSBrIcz3LSmVsQu22Fz/Ras54XU
         R/uA==
X-Forwarded-Encrypted: i=1; AL+hErE6uGQy5EFzAVkxDVKP5WLYiMDxGOdT2Ur6Be9vGrT0QN6u0lmsDPu/V94sgGgqmlnRhAAkeursuTS/bO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z85k4rg5xF30YdbriNz8yRQDRCZxw1oycNnwYaXunl+rUkV+YlR
	umLwfNUso38eCbR+6vh5gWRar46K8NbgpKwL5zgmmo19avb/jYUQGmsjduoeIHpUL156jn/nviB
	KuOr2s+kX/83S27UcoDAs9wSEZzH1M+E=
X-Gm-Gg: AZFdTZffV5U9U6ff6VCYubGomENvWd/1lfL83Pd/XAKpZgCsyVPv4PjEk9zKSezQh2I
	Wg3+eV1K+jFq9Ke8JyCVlcJV4Kzm0bxBpUv8cGloOPVyzCxoEFpxbzJW/xEapthqqPVinVHVfAo
	7PYPw4/eL26HIl9MmHplaVjwvi0Ybl0aFMoc8PXNSvc4oxDGz45NtGZoS57lbU5UnL168pknprA
	psfYTytApEqdXO5Kh31GP7kV7ks16U6AZEg3Ze1U7MfnX2al5r6mTbXnP1N+1b+On2/Lp0ZbtNI
	/98eOmDLYwxSIBK1agCkSq2tNOOYCuXTAf6KFJsSBn9Jn22MGDqu2mjwgD+1k1pfR/mqNR/FsxS
	+AYQ3Ji1uHjkiIwTxGRFoDyqv8sSEWLZOWbYMvHB3kJ2SQ+uHs4WDxTicjWMtb78dbBeH2M0p
X-Received: by 2002:aa7:d355:0:b0:6ba:3867:42c8 with SMTP id
 4fb4d7f45d1cf-6ba38674444mr9429334a12.30.1795614903850; Wed, 25 Nov 2026
 05:55:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123063842.64536-1-juanagusnicco@gmail.com> <CADsVqVCugK=ruV+gBaUrQ5fFXG6CwH1pq7K_UH_TabF47-YOag@mail.gmail.com>
In-Reply-To: <CADsVqVCugK=ruV+gBaUrQ5fFXG6CwH1pq7K_UH_TabF47-YOag@mail.gmail.com>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Wed, 25 Nov 2026 08:54:52 -0500
X-Gm-Features: Aa3M54r-sE3hMUxP9jZ6zXiXG9OiV7EwD5xqyvZM8gCofWupHyd_aLhlc9atgwY
Message-ID: <CACQ4AcjM=eQkaFBupHqGZD7v0Ah3D+y1x3W7Lbssbmr=9Ft2tg@mail.gmail.com>
Subject: Re: [PATCH net] tls: set the copy cursor before cloning plaintext
To: Eddy <eddsterxyz@gmail.com>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-kernel@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know if you were the first. There is nothing public from you.
Kyle Zeng first reported it publicly on October 30. I discovered it
independently.


On Wed, Nov 25, 2026 at 4:27=E2=80=AFAM Eddy <eddsterxyz@gmail.com> wrote:
>
> Hello, quick question, was I the first to report this issue or was this s=
omething you were already aware of?
>
> On Mon, 23 Nov 2026 at 8:38 Juan Agustin Niccolini <juanagusnicco@gmail.c=
om> wrote:
>>
>> tls_sw_sendmsg_locked() copies into the open record by cloning space
>> with tls_clone_plaintext_msg() and filling it with
>> sk_msg_memcopy_from_iter(), which starts at sg.curr and sg.copybreak
>> as left by whatever last added to the record. The copy trusts other
>> paths to leave that cursor in the right state, and they have not.
>>
>> Since commit d829e9c4112b ("tls: convert to generic sk_msg interface"),
>> the path that adds the caller's own pages (sendpage, later splice) did
>> not move sg.curr, so the next copy wrote into those pages. Commit
>> c5a595000e26 ("net: tls, update curr on splice as well") fixed that by
>> making the splice path leave sg.curr at sg.end with copybreak 0. That
>> is only correct if the clone adds a new element. sk_msg_clone() instead
>> grows the last element when the cloned range is contiguous with it, so
>> sg.end does not move, and the copy starts at an unused slot, wraps
>> around the ring and writes from sg.start, into the spliced pages again.
>>
>> The spliced pages can be page cache pages of a file the caller opened
>> read-only, so an unprivileged user can change the cached contents of a
>> file it cannot write.
>>
>> The copy path always appends after the data already in the record, so
>> set the cursor there before cloning: on the last element with copybreak
>> at its length, or at sg.start when the record is empty, as
>> sk_msg_reset_curr() does. That holds whether the clone grows the last
>> element or adds a new one, and it covers every path that adds to the
>> record, whatever state it left the cursor in.
>>
>> This is where the cursor should have been set all along. With it set
>> here, the copy never depended on the splice path moving sg.curr, so
>> neither the original bug nor the one introduced by its fix would
>> have existed.
>>
>> I found this bug during an LLM-based audit. Kyle Zeng and Eddy
>> Tsalolikhin independently reported it before and are credited below.
>>
>> Fixes: d829e9c4112b ("tls: convert to generic sk_msg interface")
>> Fixes: c5a595000e26 ("net: tls, update curr on splice as well")
>> Reported-by: Eddy Tsalolikhin <eddsterxyz@gmail.com>
>> Reported-by: Kyle Zeng <kylebot@openai.com>
>> Closes: https://lore.kernel.org/all/20261030042138.73739-1-kylebot@opena=
i.com/
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
>> ---
>> Jiayuan Chen posted "[PATCH net v1] tls: fix ring wrap in
>> sk_msg_memcopy_from_iter() after splice"
>> (https://lore.kernel.org/all/20261120225720.89044-1-jiayuan.chen@linux.d=
ev/),
>> which sets the same cursor in the splice path. The two patches touch
>> different functions and apply in either order, and this one is still
>> needed even if his goes in: his closes the splice route on mainline,
>> but not tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where it does not
>> apply, nor the record split on 7.1 and older. This patch removes the
>> copy's dependence on all of them, and applies unchanged to every
>> stable branch, because tls_clone_plaintext_msg() is the same everywhere.
>>
>> I have an exploit that lets an unprivileged process overwrite the page
>> cache of /bin/su to open a root shell. I confirmed it works on mainline
>> and 5 distros. It is available to the maintainers on request.
>>
>> On 6.1, 5.15 and 5.10 the bug is a race, but an unprivileged user
>> won it within a second in my tests. I have another reproducer
>> available for those.
>>
>> I used a fuzzer with a page cache oracle to confirm this patch fixes
>> the issue in QEMU guests on mainline 7e1392a42ea2, and all stable branch=
es:
>> 7.3.5, 7.1.13, 6.18.64, 6.12.118, 6.6.162, 6.1.192, 5.15.225, and 5.10.2=
74.
>>
>> I also confirmed that it fixes the original bug on a kernel
>> without c5a595000e26 applied.
>>
>>  net/tls/tls_sw.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
>> index 226e0f176fdc..efff7a02aef2 100644
>> --- a/net/tls/tls_sw.c
>> +++ b/net/tls/tls_sw.c
>> @@ -349,6 +349,17 @@ static int tls_clone_plaintext_msg(struct sock *sk,=
 int required)
>>          */
>>         skip =3D prot->prepend_size + msg_pl->sg.size;
>>
>> +       if (msg_pl->sg.size) {
>> +               u32 i =3D msg_pl->sg.end;
>> +
>> +               sk_msg_iter_var_prev(i);
>> +               msg_pl->sg.curr =3D i;
>> +               msg_pl->sg.copybreak =3D msg_pl->sg.data[i].length;
>> +       } else {
>> +               msg_pl->sg.curr =3D msg_pl->sg.start;
>> +               msg_pl->sg.copybreak =3D 0;
>> +       }
>> +
>>         return sk_msg_clone(sk, msg_pl, msg_en, skip, len);
>>  }
>>
>>
>> base-commit: af6737b9066832a2017c281159950ba92385ce00
>> --
>> 2.53.0
>>
