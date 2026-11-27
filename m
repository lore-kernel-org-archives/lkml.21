Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794929;
	b=ClUWeY/EYqGMnW/UZDwzoNyRgY93dEwIMkcsOx/twnU7ZbeBVhezR70mk4DH2TNN9ce1
	 sPAexxB4YHACvxXs5VHWb6Fqm1pXAwQPE9GZ9HVxG50rvUfDTlfzTTrOtbpIIJqf0+Sgg
	 Wd91oCU2jvsur9S5N9+5vlAaswBEY0e1nrt6UAxLGyID0ZPISLUZthf1An/GmBtVFxiHv
	 31IHk/eQxWL5jMvAhnomq+O9s29e4M7zng+IormdvVFa3R4/TXRhLmCpt4kyofws5EB2V
	 51wD27J80sTbXptyi5WYlV0T3RLLRSIW/S30cu1Eib2LkxNatYvVI1yUcSmIoVbcnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794929;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=2ScdCcRIkudYolKbrXTJ6TMaqaW6RAqzdJYTdrOPaexQKUh7R8YLqB0ej9J9zuhMhHOo
	 TqO1IvofFXQ72Fa688iPs69LCfNmaAUZOUHXxYfVWvMNHFv80k79zg6KMzPM0BmT5DG9E
	 PyY3dX6kBbHPP5sAQU9+SF+u6tvU/E+1eRjeqVCfJzKlbTJy2mpvA7ioOs6p9ZEwKJWcA
	 80jez8EKeI1VSOPsfQ9KydjhWhNzyi5UNLt7nLjFLVrYoguKibKCUifaTWz9ymDX1Ub2h
	 cSUU4zN43pWIhMeePto677NCU0aj1Zu/hTLGnOrwdrlIlJknWxc6eHiR0O+dXk9tbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964DB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso9351970b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794927; x=1796399727;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=V7rC64voSj7W7X5fBzZ2uhoA4wlXCzem41/OlrNrSqisA7tBs7tlc1CdKO+MaUx2Wt
         6raSwkyH8fEnt3NP+1A1jl1p7paSLbHGLpOmg+QIkENhGHka/1E/fDitRXeKbtzWnavd
         7MbXwi+AafzKnEetO8lLLdXz1dKBdmEqLWXvp1ccHSVGSGo7d6hzzHqpfv1D3TE2wrv0
         ETSBR56OKZoR3JqpANHN0k2NdQs/ZcAiKrbL7RQCMAdBhL2k1NnW4HNRrhH82RlZowU6
         UwVKCn9bs8F2HuQEor8JJf0apuHxzCG7hWGJSfEFWIa4bD6OlFpMU8zz28ihO1w5dstx
         iAAw==
X-Forwarded-Encrypted: i=1; AL+hErGZgfAovJssIwJk56dlW5bboJGYTVmI5uljq2W4I4d7I71vqh+vUr5Fr/6iC8KGOaXB8DzPsmTqVBlHBZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qI0atZJUySJYcoE/a1sMBsM+DY3EWnel0nz3dM8AF1ZpeVjor
	eCK6356QZFLzfPUJTy0VQCi1DBMpPCTPhVDowvXxettfyRU7K3SFIQxe4H9ObcrMPrJRjwFR/k+
	fNnq5XWRnVEiV/KDfiOblsybZRp/g7ZFdhCgT5qeCrWTVZ454Txwh+ICqo84=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3502:b0:4ec:77df:f4b1 with SMTP id
 5614622812f47-57a09e0c7f1mr30072375b6e.25.1795794927619; Fri, 27 Nov 2026
 07:55:27 -0800 (PST)
Date: Fri, 27 Nov 2026 07:55:27 -0800
In-Reply-To: <6a4c22a9.57639fcc.86d58.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09a7ef.8ccee5ca.1045fd.0273.GAE@google.com>
Subject: Re: [moderation] KCSAN: data-race in init_file / prepare_creds (3)
From: syzbot <syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com>
To: bbnpreetsingh@gmail.com, brads@mainlining.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	paul@paul-moore.com, sergeh@kernel.org, 
	syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
