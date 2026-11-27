Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741102;
	b=SMuuBtaHoBllaES8u59+c2H6vwAABp+2X3JSUywI6yRPwbedMIvmAJrAVjVMIdT1GBY1
	 ue3v8B0uYd3ysiHPhdwYz4BMQpLidHoKc4KGEG+siGzgtgA8fgnEaMwY1/RLM3fKU4BgT
	 2BHg977AfuZCpXSQU3Cx8wROdX256uxYrObqXekJjPm/6N9hinwnkqNLF0mZdxMwK9A6D
	 BYsQ0eg9BAlAwUeOt5F/hQvnuTK6gXLq947sTdZth/2qJoZbHwbFY65SNVoTdfKotXW5m
	 ZhhqVJUeOWvzl5PxcOlGN8KsnR/FJnA2Th3n7DNZ/BMJfPyyL5qOhSUnwPIDXLOculw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741102;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=zJeSRRPmfx5aqKu95VzqcXcOvjDj7PPpjVxkneOi34sLdW0yWvBybeJ49AEP8fnVfuGX
	 pQ5TF+foOoAEGrNubN3R7K457uVwHLJcnou7m1O3/1zYA6GofUDK4Y66IBMzBZQuz0zPO
	 Krc4tUCKbMfgp91Bw4g/GkwL+qVBbB+pWSYfOxDA3o3bzgltRI+oRH+ePxApNpHYT/4KB
	 NJ48NE+TdyyrnHVVp2/QcB46OFBKQk/Ppmit2GMuup2XpLy4naAXb6wbKsW673vS3wkAr
	 79PEA1ipi8WnqaXvkoN7djzRmVxQ83kWKOvMivnF5xh/MqEeg7jNuZHUFmw4cD+3zqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1506606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1506606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso7466048b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795741101; x=1796345901;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=lwBr9uhYo/SMyw85iAVT5FscYcxi+2lvlGdFrS8dh1rwOmtXQ7V/CSHZGT1PldDd/a
         ATQBLBmGMbxw85yQ1sPULBdDN8/LhG1VsLxwbEjmOgF09UYKGgPUPhRWAtJTpiWG5Z9n
         QIylzEzD0pyboFFgAk7qPgvAELtmHIEZgvXZjmfPM9IABsQKKKy4LvK1rcYq2Ti+k08d
         VYaPZn7yeb39TGvg7WEclSgTaHchHxwTzj/UaRPhjXd5sX7ZalvcgKEXyLblZfMb+WO7
         AFEvlmV5ICpIjITTlNyC0pjdIfvMHkDQ8OnjP9brhNwEb7L9SK5eyyKYwWxfKGKEelQT
         XIlQ==
X-Forwarded-Encrypted: i=1; AL+hErHb2elW8Smhi5eWb0y53FyTMozp/m2f0Z0q7GC4utKceezHACwnYlgMYgfaKmC9Ni16hl4mb5GIFRe/Tfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OK7kdP+tfrsKNqTpAtKBY6B9e2pJNDLDQ5nmpavKroNBUPzDs
	Ker2hXONabwTcRolTOnX4cwuIbdQ0G9LlZzPP4UtVU09xtKyKXDk19XTMJf4qNCM7qOUAh8DAgi
	JOw90706xgVRrhYw2tYve2YbAGwV/UGISZYDIqCE+aTXFTJJE6OizydZ5zvg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138a:b0:4dd:18c7:5448 with SMTP id
 5614622812f47-57a0cfdf3bemr28224240b6e.56.1795741100911; Thu, 26 Nov 2026
 16:58:20 -0800 (PST)
Date: Thu, 26 Nov 2026 16:58:20 -0800
In-Reply-To: <6a9326b2.4d659fcc.734b4.002e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b08d5ac.874039fe.1d10f8.5b55.GAE@google.com>
Subject: Re: [moderation] general protection fault in try_to_take_rt_mutex
From: syzbot <syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com>
To: boqun@kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com, 
	mingo@redhat.com, peterz@infradead.org, quchaosheng000406@163.com, 
	syzkaller-upstream-moderation@googlegroups.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
