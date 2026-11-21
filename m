Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795226869;
	b=SHNdnl92WVVa5Qp0BqGMaoe9SQHYEr12F8FzWBfLcE8aC/vJcfJ89HQY35piP/BpOGDU
	 /CNLxpuJo0HXb0fbQAZYddk3HJUWDMThKs97iIiNDvyYuz90WvJ6/40rkS32abMk2zyDH
	 3Boe10h5tjid6khiXK81w87DKJr6v0oaeA2MqGu5Gvq7Og08sXN35SkziT6u44uDND5WT
	 q4cTKMNwrhHK7h/NxLh2LvjCeVLAyE1KZKUTkpz3EJGaGvgKtLVKixuolekmzTF72XmNo
	 eZOPyziVE5TlbcV8iYtIxaZyTEMJuEYofJxTWEXpztB9KeaSewlufoAChKVW6Yj0H7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
	b=B3blzQWIokni2UpJ3SqMHYw+bunJL9PRy0C13fUhKQ66d4goA0OXp2dzuifqlx/3yGZD
	 yT1BYhZQd2UjQjVU+qvfDIzX488VvZQiH0M+Dkft0D3/woSsdk2MttXyHixowmPmfxLZ4
	 1mlv7f1yl5hLa/LneALU2Clw2XY6rTSYKKcYWlT9NqL0ZZHkv596fjfP/URQ8OyNdhMe1
	 MUh/QeX/NH06MV0fQ0eEYHM/CSdKdeqObBTNJmMvKs26m9gR7Tt+401uA5sq3J9NLLLVj
	 soGV0kwVpiH+MUMLUTAXTw7j7zOoW1a9Vxiqy7R7UPkEY4Hi4dcfG67ILoTM9pdm69g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA+7tVdp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0E606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D0E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA+7tVdp
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67da69e7c31so1648947d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795226868; cv=none;
        d=google.com; s=arc-20260327;
        b=WTTV10JiPnJa/JYItT6vaT46Jiq+KYb0MVURgeRmmuY/tX0z4YMDbZShnIHbta91nP
         eyY336EyO6xLDfEI7COBxRSi5DUtgzu9nZ39B+ZIUCHulXCVlEJTrfO1E9oQvC7hRmbY
         Me4YEpjxHs0YpjuzL1qGRdciu3QaRosF5eEsIzjZpjRl0EHSxYkqlnBE03+Pg0olQJ8N
         wnjATeTLdO4Hy76eVin0/oJ5xnspAgWWLf2U7WIIHG5VQR9G5fgCbWqMlIkm4lLHbfFK
         Y9MdQnU/E1xIIyt5rxps5SJF9PMOALJf0V54aqGpTlWmHPoXJs2yycO54EFo3zSFXANk
         64Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        fh=5XspTiwYCTdKiYnq4SITm73fgKzQW2S29SZlmAW0M7s=;
        b=FdYXraH9ix4aTdqd4xxeglF7Bt7yEAcLkGR1xE2lU1k/s1hjDOV9mwGXANw7sZdeEW
         oCvCDet4VM8x8XBjkSFwwSwz09ErFj7VoKAydNenB4QM/LOFOS9VAcC4Ts6L5qhX9og8
         2jXnc2XMsNdg6EYsmEUKsTxZRkIVoGPjC4d+MPLEYlpBmLzjgo6bFR6HVxY/ZYVRDa6+
         XIxbzalvZkJfGQFRK4a8mOriRiz4S+qF8eqnwU4FCM+Em6oYm2tZQQyPHVbKUVoMGW3f
         kB69aX4SNVTQut3mpb3bqplVKEv9yUMaRIhvKyKKwuQkp3Ack0j7XB5x7LGbUIWieS55
         m7bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226868; x=1795831668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=ZA+7tVdpbNFh76ePdLx8VXUODKwDiYgl7Q3N29SoKVQ7H+WpK9KfBKCbrIrsA/YrUc
         dAYAk9aTDvew/fpI7/NKb0jmE8pIOFHkD4w7+PSm3keRswztQGEavcXiChr0RKRvpNbA
         jUxYcCdJ6JYQNuYyZdGKr8YNVr6AOMh27dRi12H+xIIG2h/pJ7ziibsICB/LRg2sJfc3
         hzWUWKZPH5QFHgsP02GUpxk6+c4LH/MZOapd3oQdqG97WgaZrO7SUbHUKzkUZ5vLvKPE
         iE4n7jZsWk0RlMH9ImSSvMc4fglez/kVpMF/pPtBIpyIHA7fXvyogUXLdrpGnS5D4AIQ
         ZtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226868; x=1795831668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=N+4Rw/yx8ldjg7Icjim+KK31s/dMxowP2bWRGqCfPMDU6BwHTilvIFtTghD1PNnvFc
         4EnfHKas5xS5n7NPUmRUy3nR6YBK5lfq4WBaR/lIi+iPOmCoinsQsi4UlokdOE7bBw1v
         y6674t5dvVy2kEd/CLoXuEVuKWk/LCtXk1eI0eLxitxLFzT5EnW4obwjF52vtattuWnX
         mjf6TCw5KkFpc9JIN3qWOdHJ0uzzQCyPhl3Jqh6xYrSLOMpNbWoEFZgdemoCNcd9bkZX
         iE6EYbEFmG3k9otm7gQV11QcvdLbUUO+J+lh2EXpk3/jzIW9DEUWaEmhicewGakan+TK
         cxyw==
X-Forwarded-Encrypted: i=1; AL+hErHqqlZGyr/z2MBhHSQE4xNSglJGeIAGcVkeCpfGJMQERIcGZGudZTk03TmsTvJCIxh/gFZkHIArkYXb7pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jpAmNrk1T/TFXRUUTmFFGvwqNEfLajEOkkZ5fzXNiZOn/A4y1
	GFp1GXOLUV3QQrbvuRbPY1OGUTno0MiGS/Pu9w3UTpjtmlenVhrCY5MDLmmsjx/Ux3xrIiAIik1
	NObssq7NIKQk1K11L6IlzteySRE6ITys=
X-Gm-Gg: AZFdTZcKz8YYxVNSjoO8vrUB3+djfOuCIlbzs/7Q0uxzuxjZwWqPeR18WKjomuqN8fD
	iiAOmVqrUlvFCmKJtTPZFz3axqAYD2b14rJrXUefWPbw85ILlGu+7UhVxNs065YTuIZLDIx0n16
	S3kYD29TdFq1+eszIiq3vbnmzu3zKoUTQNhDQHZ7CXaQS6bPdF1DiAgxeaWyNsiDeNRrfwb8CYn
	Re/nUyZ25pX+afXeXAHIIPTMcgRQjeQLNsAGVXFGEpq7keHbD2GVI8ADby3If5WMRAA7I4krE1h
	7yLY3nN/Rjs/xCqBIFMt8MH/Eg4bQeXgZ33cH9PcUT+RIOLZHWkP6/0BuaklPKF9OfuuNOlLhxQ
	1gXMLPAolRuDUPCjA3aSEaB0Cr+r/twn/YnDkdkqJn6lwHnGXT4VoNStng34=
X-Received: by 2002:a05:690e:438c:b0:67c:2396:3243 with SMTP id
 956f58d0204a3-67df441041dmr1738856d50.29.1795226868649; Fri, 20 Nov 2026
 18:07:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com> <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
 <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
In-Reply-To: <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 21 Nov 2026 07:37:36 +0530
X-Gm-Features: AclHuK-XA1SyrZq1BHyksXey6RIqRcHtTohcQIWXmSS43XQq55hSKSbeB5ss5Rs
Message-ID: <CAMFFDGh9y6JCTJ+Fv+exsDUW=qvkW8Tsi7VfEFTowpT10bJRYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks for reviewing v2.

I misunderstood the distinction between inline replies and threading a
new revision. I=E2=80=99ll send v3 as a new thread and link the previous
revision in the cover letter.

I=E2=80=99ll rewrite the commit message to explain the hardware behaviour a=
nd
design rationale, and move the test results below ---. I=E2=80=99ll also
include a GitHub link to the design notes as supplementary context.

I=E2=80=99ll address the cleanup structure, naming, register definitions,
shared unlock/relock helpers, error handling, redundant
initialization, readback and copying comments.

Thanks,
Prasanth
