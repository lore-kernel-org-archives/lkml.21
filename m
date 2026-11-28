Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795832129;
	b=5Lt9vJ6WC6cq22lr+Nrzko+j8eixqdcPdvPTYWP9UglYngbMjDRMY5E1OWbWChr8t0Z1
	 kSMCxEumfNeASewUMnlxMC416wVQ4qC75tsVn3J7t0vmzvjjWEmxuNIwWGWplwy/b9zLr
	 tCavMlBDwZ1xR+xC4ySk9ZXQpR6zzD2ticMtwkV2MNPvBUrirGaFPBsEZtsPlaIiY0cUG
	 yeAtQAYYOkZOMZHwrBC57RKesAjOqKIyUvEnr/gd8ZsHO8s3U9JMwHR2yb73N5JF+mzNS
	 E5RQgLZzKy4uzzXZkpv13cqS1gygc9KRNvwzB4SnOCtgEUHBFKGIAGzKJEiEj/QS54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=cTkCKIr9BKcjClKzNMM6vodm0ErJibd+GTk10urmMHA=;
	b=q3QR5Hm8OjPVaUc+C4sbnDVC+58PltSp470sw+ie4XiPgYE566rBiWPjGPNnKSkslYGy
	 hVZ495/WpLYQ1eo7RGxfa9D879asBFHKCwftV1UkwPZqG3OQOHT8OA6TAjYrrOzgLuDnH
	 I724YdXtZ5PfX2yiHdmR0A8Ik5wp4BAYpqciFQGK542UkY+7t9yKbbhutEWhYHPs1Se+o
	 7Yi9BxgsMLnpWqGZdoVKugkj9aEUEDFIIY+5AZBkS5OccARXZYptXVYb4VdU7XEA61ZU+
	 qaavT7o/raB9EixvZAhjU2eWuh9qVI39z5Us3ztBfIlPsBm1Sw4F4Irm3a87UcKr3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B81606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862adf80a1eso8973905a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795832127; x=1796436927;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cTkCKIr9BKcjClKzNMM6vodm0ErJibd+GTk10urmMHA=;
        b=kqAkhpwdjYVHIAy6/9QJbjq/KoVY9rgi4yub9P6hrC8oNksKqXijkIeSGt+NmLO/2/
         qpvUZ3ai4SdZFWw4xeonZdKp4hV5fFojosAeSeAgMymJvXlu8YHcEmmzSEzYkl2r6owv
         bDLhjRkrwtXr40t9uajIHdthGsUgREY+oSQkhF+2mRRM3kvOZNPdmxVpFE1+9SDKaMjF
         aRmhpdRKBR5OUnkXkuK6jFOgQEPNiOlxJJaR3p/PlPntQkWJyooOe6qpcxcepIhZpgb6
         gfnxKYv42Dg3uYFqNIw9kmv2ugwAZSznLRk18E6t+hA5KzGHgtvFK+K57P7HTFQU5tb+
         YAyw==
X-Forwarded-Encrypted: i=1; AL+hErFy5XIDRRIvBCf10BG4lnU6/KbTvyDE7R2VDkFchPDh1xjdFAQPPHz1+Vlq+Rnj5WmrUBfmIwhgkEW5+GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ir9ZS5dJhK6IvosQEaTm9Qofor+NIQpQrP5HLa+OEhBG1cvKN
	eoCO0lRp8dFjNZUgyoq2Ihu2wLRMGZRHhdYDE/4xnFrRmPjqHeP5v20nIY/19LLu84QzjcH2i15
	PYObjcNsFJ0JbgVeUjbWK/w4LX+gIl/sjTpSuQDY9tuM1dW38TcQbq9MmufY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a3:b0:572:d0fb:ae5a with SMTP id
 5614622812f47-57a09105d60mr29236892b6e.31.1795832127728; Fri, 27 Nov 2026
 18:15:27 -0800 (PST)
Date: Fri, 27 Nov 2026 18:15:27 -0800
In-Reply-To: <CAMJ4K=WCYGU+Vp2rouaAw_wAYP73NojJRaaLsNuu=zyPLvctpg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0a393f.c4dd33ab.25911d.001c.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in folio_evictable (3)
From: syzbot <syzbot+4c7590f1cee06597e43a@syzkaller.appspotmail.com>
To: abhirajdutta7@gmail.com
Cc: abhirajdutta7@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> for-next
