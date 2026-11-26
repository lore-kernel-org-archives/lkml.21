Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681077;
	b=miCFMQoTMplXb853pJswaoJ2TxXBG6m4zb5LJXCr3AzifP+mbY020ybMPVexgoabw/H1
	 QKHY+FduH3+VQJHMKPXsFt5aK9cnroe0mPWJAQXr3qsiJUctsGuHU2zN1XHIMh7NuNeXo
	 6G+jp827A/0Shl8O5mFrWIvbHwAcBiH9slGZoeh4S9N+C/Gd+03WZicPkWtyQM9RPmHDX
	 3GLu5b4q0GrSinO40HFIX8pabRVCW6NYJQ+I3U1XhdbP8Lq3LmXDeO6S+Dud1McvU0tFE
	 KdMdJ+bJTy4H2Ld8A6RjOyYjJlvnx4ukPNi+7xS6n0gdkgi9e2FS3oqvMOpad5zOonQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681077;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZAAFRtBH862TbNDRmcS9EWixbsX+mEXr1CWTrLSYILs=;
	b=BAxhBzJY16fXI3cya1+sqCiyhYx2BG+D1mCMN8Y1kLYeuNAj4EviwJk43B0oN2m27VKU
	 1ZsAb21qUfQPbiu9nGaJ1XYLedZ2hUEJhvqANjA99MQyYbePjSg7V1PK5SevvIQKHDgXN
	 w3VSPHOG5BvkQPvUVUF27iEGQYM8isQdlIWOlvne/ZKokWasBj7gz0b7YooPDtDvHTjhc
	 Q0CC4BciTUUi0JK2hIeWAwRXMKIg8m7WjHEDfV8IrQNA/RI8u+2D5qxhiXO2YZfPxP2xJ
	 otSk+vyr14fUkOczxLrhPnx+cQE8WYHXYYxZ9itx9i9n0n1yIC8//tilpeexX9zQWwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B62F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47b7f5b898aso3056959fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681076; x=1796285876;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZAAFRtBH862TbNDRmcS9EWixbsX+mEXr1CWTrLSYILs=;
        b=i/sVwKMJhb0Org3Ut7tB2G5rCA7RMA13gSDzkD03Ea308HAeto9qbec8QlPdud0TdM
         oynfitIhxdJLlKeuuNJmu+Ohg0zhUbcohEKAWn4r2zGodlR5jB+afd81t5IsXVYNGTda
         nDvGv+7hMwSJDpC0TjuOwBWz93DrtDPxyuslR1JLvb5VXppeSForXArKyQ+u6FFiJ8Qv
         tSWfpVVjqcdyNFyhgbXJcVPEgyd5cOkrZTnGA0R2gGhf0L5WKOUqVkUiztDtSv+GznUZ
         gqUF4R+9WaOhhNggxSNrHU5LyhguorABGGqPHQH6HFJTieEytq3U9ZhJVHqbRbPUHFm0
         Hapw==
X-Forwarded-Encrypted: i=1; AL+hErEI13GxITAG4XTXmdhn9Gf+DA5/mw1MtxQ7SzbeB09dsFK9cceaC2ah4pCsyBOBitxgumy86J8gkxxHB4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GSfDDNrT/8A6yoZT2Rfo+Jcvvs9Sj10kFQg/q0IAju+IIi9IA
	H6zW/rnRBEAXObBkx4dW4loOx6qPIu0/jv7V6xqqYxi6ecBmXE+xWqmipRJRBXGiLd+3v+Fnl1B
	4H46FC+jzhIe+kiJyYgkUyrSYRwNEqGbZalMxKq9PsGU7/lXIGawaEVobf/0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f09:b0:568:2816:33bc with SMTP id
 5614622812f47-57a0ccd186fmr19901601b6e.66.1795681076183; Thu, 26 Nov 2026
 00:17:56 -0800 (PST)
Date: Thu, 26 Nov 2026 00:17:56 -0800
In-Reply-To: <3c4d21f6-1e8f-4a77-902e-106356fd5e26@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b07eb34.904258e1.78503.0024.GAE@google.com>
Subject: Re: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru
Cc: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 25faec9ce61c01fb45abf812a222c5b43c3cd5c5

Command #1:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

Command #2:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

