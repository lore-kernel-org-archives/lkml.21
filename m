Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591779;
	b=bxXEp17fpOgClN34AVhXIjJ55Y20pxR0QYtakPVP53BI/6SeyazMyEoGB02+AXYXDq7D
	 ZlJXggbrFYg2H0vbI+t+tbQ7uWbdfWxKX7wIoEaw5JxiyXXAcgABo//cXzrpDCGhBLHWm
	 KX56SBCZmlD4AslcuaKFpCTxMtcXnvhl4FSR0UISaiXojFzh2zduUBvSbPAdIMySrMZ4H
	 VVWrc+O4FAvNdtWbAQz16XAZQzlBheBy7ZpmK1In3bN+MWkpdZXhpf7qSLP2ha7PTDMAP
	 qq2aiPxpaZApaXTRerWzDtslXANRH0tBFtAqgXNxa4ZgSLzeN5UeY1dx5UeMkwPYSZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591779;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5ASMf0Q0IZoUjb7XIzBethXRQ2xxqpnfFXzN5Y72Ppw=;
	b=JAD3VBWnp2azLXIz+tBdsuYHI5AyJbcSgIup8cxq9ovTUqh1ffFJjGCOclxz82JASfJI
	 9BbzjWjRXZLtyLLAagCHoJMarwFRTI6pJDfTZ6neaGa6Nsb/w6p4SdhZ4wjVTYTTmgPyF
	 8NDcrHpGh6eRMCyUh0rK17A0E6m+OmBOWnCc1QEjPGOBpdmL7KhLyukVEYObVbUGOm7AC
	 EE+6nv6kgivq0e10ZkpEH6tUgxtOICk+CQGSUD5M0bbEupYBJshVJkhfZ3zYl/eU4Kq7A
	 EPypscXfql4J+oMbAeB0laF/nmdirPj8qv00tEtpy1QqF+USbSKbTdlRbrkqt3XbeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMCcHfr9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D08C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMCcHfr9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C48F1F00A00
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591778;
	bh=5ASMf0Q0IZoUjb7XIzBethXRQ2xxqpnfFXzN5Y72Ppw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NMCcHfr9lb2tDJVp7O3lXzn+N2X/1h+Ri7m73MjLjYJJU2supJjYQmC89wemQEmal
	 N9l58SKHTFV0SJKYHnSX2Pn70lTUS3mCujXs77F19zj7Tio1/hI8ljCSrVEPDqSB5f
	 rAjMGoFZvofkh8VhYqyiLEL2EIPTz0MVRnOUnFBtxD7xzkfuwKTfHVOvhwQoBzXjpz
	 /LkKxjmb8YdmoA2p7/XNDs9lRyajwaNacGBeSZl2BFISHl5W7X/8QOKL+xPDhCYvXB
	 RZJfPsRNCMzepDwjssIkv4kkl1+6bvFKd7x8xaj4M8dYrRCGGrJKolpJsjv/wIldip
	 7YdWTcZePmEmA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c516a192844so482461466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHa7dtwK2BowLFb3X1db1DecKXCv743uvKQWU07sa+ptx25mTAj9odNsnfBB47L1p1u5Fdhiqhxs3ocCkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/Hmg9aVSJ70m58AOnyi3B6j7YePE4KBucV6YOArLVGuZK47u
	bj3BKTaR5MQZ1QQr49mAVFKRWtyokYYsfwfR2JPo6/eL/KBnNAOhP7ko13p6SvhJDJWDNvgEZ8t
	aEK3l5pWqD8EnqKH9QbJFBI5hyaphEE8=
X-Received: by 2002:a17:907:9692:b0:c48:ddac:7eb1 with SMTP id
 a640c23a62f3a-c513aad95cbmr1357457166b.45.1795591776579; Tue, 24 Nov 2026
 23:29:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132554.1185817-1-huiwen.he@linux.dev>
In-Reply-To: <20261124132554.1185817-1-huiwen.he@linux.dev>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 25 Nov 2026 16:29:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_GDhds=X8OgLCU6f6MqtF4A-7fZiQz-829SWSdUKJbdA@mail.gmail.com>
X-Gm-Features: Aa3M54rw8hTnZ1ZI6EcGEc4ZzgV5kkXbOTeOurhBS1FPtiz9jGd2ANQqnnoUyNQ
Message-ID: <CAKYAXd_GDhds=X8OgLCU6f6MqtF4A-7fZiQz-829SWSdUKJbdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ksmbd: splice READ payloads over TCP
To: Huiwen He <huiwen.he@linux.dev>
Cc: linux-cifs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:30=E2=80=AFPM Huiwen He <huiwen.he@linux.dev> wr=
ote:
>
> From: Huiwen He <hehuiwen@kylinos.cn>
>
> ksmbd reads file data into a private response buffer. TCP then copies
> the payload into an skb. If the reply must be queued, ksmbd also
> copies the unsent bytes into a queue buffer.
>
> This series uses MSG_SPLICE_PAGES to avoid those TCP copies for plain,
> standalone READs: patch 1 splices the initial TCP send from private
> pages and a header page fragment, and patch 2 retains references to
> unsent payload folios on the send queue so the send worker can splice
> them as well.
>
> Summary of fio sequential read results (16 jobs, QD32 per job, SMB3.1.1
> tmpfs; each column is relative to the preceding commit):
>
> Channels  I/O         Throughput change        Host Gcycles/GiB change
>                      patch 1    patch 2          patch 1    patch 2
>        1  4 KiB        -0.3%      -0.9%            +1.8%      -1.1%
>        1  64 KiB      +28.4%      +0.9%           -31.5%      -5.9%
>        1  256 KiB     +60.8%      +5.3%           -40.5%     -22.5%
>        1  1 MiB       +51.5%      +9.2%           -33.1%     -32.2%
>        4  4 KiB        +0.2%      +0.2%            +0.9%      +0.2%
>        4  64 KiB       +3.9%      +2.6%            -6.9%      +0.8%
>        4  256 KiB     +12.1%      -0.4%           -43.0%      -0.8%
>        4  1 MiB       +17.6%      +7.1%           -39.5%     -34.7%
>
> Huiwen He (2):
>   ksmbd: send READ payloads with MSG_SPLICE_PAGES
>   ksmbd: retain unsent READ pages on the TCP send queue
I don't see any patch using unbound workqueues in this series. Will
you send it to the list later ? or need to check it more?

Thanks.
