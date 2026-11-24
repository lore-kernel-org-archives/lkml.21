Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524686;
	b=4HFmrcqWHbBsiu/gBPPh5iFcvVFg1lOC3rqtFUpTkAhnVJBctXJToVe74oJHGpP8n0zn
	 Kzq0jQjLkPUo1VnORtiRvVz9pXcJS4USeHD790LVNOuMD4kwojQK8Oi+/FRVP14leYomb
	 TkLRABxNQJ2dS4wJ7fd1jNYOeuUh5GZBcAd74JAWDFm27cnq7HNiYT/Uuz3Lw3Rv6r+C3
	 rKvCHqKAuuj5NCDboNbO8pPWD3bRh0R6xgEgQCRkV95yXTUGKVKkwVrWtmR0ll7j7EyGY
	 gcxWJzR1m07EiO/OVj5I2wf6NF0MEwuvoE8W1/tl8xhygU6oVJ8KBVeAbXQBfru3OLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524686;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=36V83u9D20d1lC1hhMB27uss/MFpnTE6+sKwuTbX2KE=;
	b=VenvZciUSq/GaOGZPF6VM2fpQIiz9+97+YBif+z1JCpOP3/Zc5LC8vJ/eBMDOva6LybK
	 Y3FtnBbGWF147BCVhjk+P+ccTbt2Ffzl8vV0cnOkvCHM0gSNHQykq8mznoc4NhyPJ1g+7
	 Njnd3L5Q4mVR7h9iKvBrZ75YuQ2EbnRTKQd9oz/ueYiOdda2IUc5WC+eJfVT5EsAZM2QJ
	 TAfIq6O3tweJZZAGrhKQAKmWEprqAxRpvtLBe+03vLv951Wa/b3trWTGJRa+J0cL+UJD0
	 n+pX6gfpl1ED5d+CxNSN35Sb+r6wxo7fmyC3RiSmuYRoWqhOPRobAUaknXS4saAYFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-862bca06702so8128959a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524685; x=1796129485;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=36V83u9D20d1lC1hhMB27uss/MFpnTE6+sKwuTbX2KE=;
        b=oZ69U9q9ApHuQdftaRqSOMhPNc5tz0sMGfpfAoSVM6wMJ39ISB7QY012cg+CQmxb3O
         OWTgKYgZAd5e8N/hTNzaQmkhhSICSFsPyZRXcyNarGSDIKdbhwpV8kLLW4u+BBR9nIRr
         +xDFCHllsbDuuS2kHp9UfjIDwK1dbUWik6bD59kpF88LXbQdoif3XUY/ojsYwVNc9Dtr
         gcZWw/7xn0Mnpc3lK+le2VsVJv/67Ci25lVIMWr0eAmFUdoT/HJ+/x/g6ztxIhQOHzaw
         /V/S8jAoxcP+PCBBJsz/a6l4cRLK/O40OA4IBLEeq5AOqL628QRyodA45YUlpXeakosv
         BoGw==
X-Forwarded-Encrypted: i=1; AL+hErEOhwElsFG4KJREmMVA/eQovdve5Y6kPCza/G0FblTfyau6ZQBRkoPDFGkA/xp7nKE2HVY9rJ1QVapvY0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Fopy4lFQxgHb7TjLK65dWG4n+ZTlusdJNlysEd5/upThMITI
	4ZUnNXw0vzWIlwOkeanJWUTe2eUB5+L//3qcrYvFzwpoMjK57s9HJ3xmepmU9YoYNVLbzk2jyen
	/QY64PBwFAw0RPzL0g+MoS0J5QYgIRY7ywvSOIrlpO0E/J5VU/fvW/ufuOwI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:244e:b0:4f5:aa1c:d934 with SMTP id
 5614622812f47-57a0a71998fmr16916714b6e.38.1795524685304; Tue, 24 Nov 2026
 04:51:25 -0800 (PST)
Date: Tue, 24 Nov 2026 04:51:25 -0800
In-Reply-To: <20261124125122.452127-1-uladzislau.zhauniarovich@ltm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b05884d.9a2182b0.37b108.003a.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] [mm?] INFO: rcu detected stall in
 kernfs_fop_open (7)
From: syzbot <syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com>
To: uladzislau.zhauniarovich@gmail.com
Cc: syzkaller-bugs@googlegroups.com, uladzislau.zhauniarovich@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> From: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git 2c411cf17a4a

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

