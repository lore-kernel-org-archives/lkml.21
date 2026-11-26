Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709690;
	b=Nl5KAPOyOkRKgewfslcb/fX63ldAoM4AtUnkJP4H7l9NoYJ+iQAGOz3Kp80K6u8H6IdK
	 R+/PpZ15jrWHV+hbrS2ZYs4UHIuDi4dc/k2kKK1OqBgtGcgkEXX2jgClEKmubyyjWW/N0
	 Y4nyyjPG1LdCPivVPc9bUyKz8GhQD+WTplBEJDFd3eNdm2Mh1Gs6MxACaGbxcM3kF4oI5
	 LkGC9VBLclDos/bJrd0wkL6YPSOAR2vg4f4TPWnTIVYC+fJfPVMfzjKE3Qcuze9j604cV
	 bqUsMtHlpvllbBkUwzW4Is+Wq0oJ0Baz+vSEVWKSaF96qr49pPEc/hdFkkTP5cvBVxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709690;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=hiBkEoyRlswuX/tgQ/gMX1tQitRKCg4FG/LMkDH9HcU=;
	b=0evfdU15pN6CZFzGhAk5KEGOdaWoal7GPSETs5zoUcEu+OVNzULAoQCMgNJGFr2lzxIn
	 XsKhagkpCTBd4QAmtuGZ04mF5hgj66RvHSUCEnSELuUB960n7zSP+trXMTWgFCGjrb8lS
	 1rmNNcvZwEhXsKoK680BTXc3v+LvoIWN5EulBmqGlT5wgkl1Fi8noMXT9ro+Zx3x6e92s
	 CSE7BGojL8euyaPlwYLga1JoFcSvDVLLHD2fwjRrppQa2xNlXAmlNmCpoMzUlhFYn3g2N
	 5FhRmxB9cShYJsfnNne+7kK36BUYl3TnMzXFcVsgjOyGh/gwI6Weo3RkEEk7EnDwzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ab90cdf747so9570034fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709689; x=1796314489;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hiBkEoyRlswuX/tgQ/gMX1tQitRKCg4FG/LMkDH9HcU=;
        b=Mxxye6ClMpypPHVra3W6wbETNr6m5H7AMvR9oPRM3As5CGLMTLZZfNoJ15VNyxhNjg
         erb7Y4HtHz6//0NX4LwRnRV3Kvh/5eBir+9EokHPA0eyeXOnypKp8E3Wbv8dIKigGPdD
         3/mkIqYcqkvILMqg/T1WvBfAddAXvf9LBT7jcqgrdscWx2wlZzrc82xvgVFZ/U7LYrV1
         dtZcc2HVIx92x/YorMrWck9v5lhbJsMrgAxPLYeiVYxdep0uos/0yAHMS4sX/AXHJ3s+
         2tSccnz1h8r13vm8Bpi+SVO81D//zh1uULH9dQWBF9gve02D1JGh0V054mBbd1321g3V
         SbRA==
X-Forwarded-Encrypted: i=1; AL+hErHPHQnK/MYRcWI00kHvdG71d3a9dYwCBVvNfkrh3tWEtrQWRSzjLR+tCuYKG031sukPPiAnjaHF/qqcWKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QSYciTGWvVHsRioxro5prhJnxXeRWkei/o0ShN6rPGXvW2DxJ
	kpYKEIEeILFT7hPPUWuvjvUpVM9UvLOxCRK3EMBPAtQ09utnOGj6kAnV7OVnUYMR7ixNVuwCPFK
	iXCh43LjA1YWy7uBoeJNVhkhaeSsgcX2qRI0UWukbsUnjh1WmPSnMzaRxBD0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6414:b0:4d6:9133:cfea with SMTP id
 5614622812f47-5797e590039mr17902419b6e.47.1795709688897; Thu, 26 Nov 2026
 08:14:48 -0800 (PST)
Date: Thu, 26 Nov 2026 08:14:48 -0800
In-Reply-To: <20261126161439.154819-1-parri.andrea@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b085af8.28411dd9.2968b4.0005.GAE@google.com>
Subject: Re: [syzbot] [xfs?] KASAN: slab-use-after-free Write in xlog_cil_push_work
From: syzbot <syzbot+c32ff62cf4913d345d0c@syzkaller.appspotmail.com>
To: parri.andrea@gmail.com
Cc: parri.andrea@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 6c93b4f5629c1..4acd0c3451da9 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -1382,6 +1382,9 @@ xfs_buf_submit(
>  
>  	ASSERT(!(bp->b_flags & _XBF_DELWRI_Q));
>  
> +	if (bp->b_flags & XBF_WRITE)
> +		xfs_buf_wait_unpin(bp);
> +
>  	/*
>  	 * On log shutdown we stale and complete the buffer immediately. We can
>  	 * be called to read the superblock before the log has been set up, so
> @@ -1402,9 +1405,6 @@ xfs_buf_submit(
>  		goto ioerror;
>  	}
>  
> -	if (bp->b_flags & XBF_WRITE)
> -		xfs_buf_wait_unpin(bp);
> -
>  	/*
>  	 * Make sure we capture only current IO errors rather than stale errors
>  	 * left over from previous use of the buffer (e.g. failed readahead).
