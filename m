Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051030;
	b=yaDpCTWzB0LiUtAE7B8yLqbepIdMUld0zjSarW8Tq4aZslo9Jh0V/CathrnScXiKfinZ
	 T9s4mdevPcTdt3yJjjZvkkVuNssZzecWse3hjzL64s54piPV8vyGcKixx0Zh3MqJUrEKy
	 xx9hunE48yubPJ00JfgxC47Q1iPhH8lomZ/KD7cr4czUDfCupbZiUY4gW7Ti8Fz58gXqo
	 KvIculGrJv4JvLckDc2oNiaeImgaTiEcc1aEdvdmiyNMQHAn3IyTCL5PyM8bRhzll0rt6
	 07/3jKgj1pIzrIrY5y4FaidtqWBzYPIxjzrgjpG9aCG/U+iZHKQUHqjLC/N+88vyOfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
	b=q/XCg6/o8DUy7tGiuyPLWVkxJq3twiU8c0QJaD2FMqWytCB4jZQzk+CA+U9wpIyRv3ci
	 pzLdgTZE3JJiNpy29j0AYzrH0Xp4dIReUIhnbLl7j4Wy0tnZ1/Osn6YWoE9bBApp7OBa5
	 PhXWzlz6AMAedZkeco6KI9SGf9nyaYaNyMt3pEX3JTiohOxPImkHC3LGCcto52aOLrDio
	 +cB8ZEfq7ypTc0Q0D8p6+F/aIWNTr/v6wPVy/2kMGA4mSy3Nr4fcrmFjPoqquZ2bsh+fv
	 gvSPYua4XCDWAFwdfVwAbwi6SgQIC81H9k1G9zAGYaMPhxvlo6Kco/bPRxrfrd4d1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E80606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso975279a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051029; x=1795655829; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=OodLDqWVLKJWRJ4hxsJ+0H/bezzEwzFKojs+r32NAdCAkVMc4Nwq1iDewob/8kYBUv
         JCfPxpSQ0HMUags40Mt1pFZ1Gkt1tkJ8RqaEVbemFmkZJsRHtcjynKb6UZI+MEUaKplg
         i+aQ5CLAjSvcZpVSNhZFAnuVWMV14aj4vhpSEkUdnpnygjvdVw2IvjbA0YRQMV6jrS1o
         clGsv6cndA8hxyP+N2tDp/PL9oxGHjp5BWXzOtscSWyHARXkcSK9Z526nre/f3kQDQ3l
         e7nAdv672XkwpthS6aIWB1g0G9K42GfA23U+7MqGA9SAp1oRKVgq+Usm3JkEr91+e0GQ
         6v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051029; x=1795655829;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=LTrotiyiJKNclf/mg+bo47Ktx7lCpofb9CNbArUWANUJcezDjJnk4f2zTb7IdgT5lo
         gFDXsHgDOplGVbDqiK3clwPQszMCc9cZ7nywMNJ7iAyF8cPfz87fjwRmMSEHTOUFdz0o
         NUQzGtQQsn9Nf8NtBRTyYIL9LuO2Fshr8llBlA3knWNyAs0ZalNXMGPfqsxwr9cUusQU
         Dj1zfE4JgkBFRAjXiWC9BeTvM07zVHg8rN7PVMGvzyQFQXOteASm3+0MVRUwGN0hWXD/
         n0HP/Ynn+W7iOkwBck4QxCGmhRdJT6//UwyN14SaxXQshzHsXoHp8TQNPPgSJyPDBmun
         ITmQ==
X-Forwarded-Encrypted: i=1; AL+hErHmKoSjZWwphsHGuimgHRXcNFiD4DlHtMQkhaiozoajoarQ4RPMfgrbidoAsonfo5mNoXJq9MyX/lEwbb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cH15grdiTWiIovVck64l/jq4UUVO0JeUy3jCN0XocQYoK2UVm
	9PNmYKUNwXvQP073lFbFcPYO9zHGw2TP5TBfmcya065myMzw1uVm3PwH
X-Gm-Gg: AZFdTZdCP+YmB8dCp6g0Us7rSjO48Mlzb1ugC+Y/7IEts+k0T5qnrpbqQr+P/nrUwjN
	bI0Pxi7LMQd0jr4FOeS2RQyo44Zd3A3yM1PBrUqqgpUb0pXWcgPznDKrz3G9vX6eMDqXNwVL5iL
	gRnrpGPF0lQ/59rNGuNlZyaGePHbruYVSqESGfEwvvYhhZMvo0mvSTBxZhcU6kUg+1njCknWs38
	HbuCbdu+obJ/A6As6p+M0ciTJA4RUq3oGqmy1zj1z5a4g967F2pv9Ay23QXSIX3O2GxTMhFAl07
	ZY7Q87RaSwqSkLSk/fMXQekdTTc2b2DdT4d3Judc95eXw7G0k46Yer0QDXHQjtyq4ZCzXI5ZTF8
	gu8nYxEq7jdXDCB+37RzHn6vx9PDXvusnU51y8VaEGZqL3XRUuGMKIuLk4kXOkK0BqS0GD6lJly
	iBp2/GVUh3HRwqo7zSilKg5uKhrMQpHw8PFWJ8CMX22jR20rBQdbQ45e3YBouzJEnIFy6q1/j6T
	+xBFMVPeWZ3pxXSpWorxWDwF1WsJdzIrrMRGBbgi/uolVQxLUMiR73vY1/tRVi2cG5OtrDYT/8l
	OTCLgPeDEJsqzho0Nl/FAusiBFrykTtPx7TusvuIfkejT77Gr7S+TvwcASkCLIObQa2uo+ueddb
	SQG6v7RNcqpoEMV/Rqug58+tIthuA4gtU2g==
X-Received: by 2002:a17:90b:3e82:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b3d07a85c3mr4591922a91.48.1795051028783;
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402981814sm107875a91.2.2026.11.18.17.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:17:07 +0000
Message-Id: <DMYSHE1LVD7S.3IT6CHA55HJGY@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "J4f J4f" <shlomojune6@gmail.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avzIz70qnJIA2t3x@sirena.org.uk>
 <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>
In-Reply-To: <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>

On Wed Nov 18, 2026 at 3:47 PM UTC, J4f J4f wrote:
> On Wed, 18 Nov 2026 at 05:36, Mark Brown <broonie@kernel.org> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>
>>   kernel/bpf/btf.c
>>
>> between commit:
>>
>>   b7cc45994c3f9 ("bpf: Check variable-offset accesses against special fi=
elds")
>>
>> from the bpf tree and commit:
>>
>>   ca4395aade31a ("bpf: Walk each type once when looking for special fiel=
ds")
>>
>> from the bpf-next tree.  I'm not confident of this merge, it discards
>> the bpf commit on the basis that it looks like there is some new
>> handling of special fields in the bpf-next tree but I'm not sure that
>> overlaps with the fix.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> Hi Mark,
>
> Thanks for the report.
>
> I reproduced this on bpf-next master: the rewrite does not cover the fix,
> the check in btf_struct_access() now only looks at min_off again. I will
> send a v4 rebased on top of the bpf-next series shortly.

Pls ask your bot to stop doing stupid things.

