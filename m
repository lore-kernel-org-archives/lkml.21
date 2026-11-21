Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274425;
	b=hWcpF0pFW6cwPnL3GwBGIxwOfKKjqFVuTxvwjXCSWPDRgmg0vjnJzMBUDHlQTsRT/4jb
	 XmjWsBFcEDhmJVkqQwqQoO7Gn/SfEZhwIn7DFBsdAJURZtHx9eQvCfI5MR1sN434hYGFv
	 2qE+qXnQ15uxp2fhsT4u1kHB9btDlID6ctmfRv4Pzwrw+n0AvjHapp2b1a+7K1YJlzbVs
	 abv5UJtCleVX4WnRAuAuBCQZVtbsVY+3C/MZ0Z+G2x/tynRJFBtK2NjetwTUEMO92fmt0
	 yuZmaKDaQKWBDm98OhRY6T6W2BvV1+ViZk5eD+J4YQDpq1+XOA3LO9US7cLGCyhDwyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274425;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=PVTEAxVm0p2TCJn9bfarnX2DpggDhSS1pLi1OgMmIuc=;
	b=oaQvFgunhzWSrYjvtdFiovrrnnm3gtRuZnu5VFBCkn5Kg7q8FzO2fbBj0mHkRmbARIvF
	 p7tGPynMoQIwtGi6x6GDqJxV+rq9QB2Qzmn+oO+XyzSjBp+RfSI/BOE9nlEh4mu788tSp
	 jcwlI9u7lOEclIBz7kCjfhTjRlqVCCiEyNdsRjJOmiIjQx8JitFWexxcjhDulOVfIzgzQ
	 MWl4L/be1rK3M7Q06cEqpZUWFvSmE4XJLv4gbXU7z4OiFez2/ADhjR+BZUTgWiEb+oA1e
	 KjCjWyx+BpzbO7zs41cXvA4/TkhLLw7qymPMob/vF24LxyFSCiH5LWPxKY0rZznnMFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CADC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8628955a085so2294307a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795274424; x=1795879224;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVTEAxVm0p2TCJn9bfarnX2DpggDhSS1pLi1OgMmIuc=;
        b=HNGrI0YX89qmtI/7Ev2pOUk4s6i1ce4ZXJb/cDXi8dHhicj+fT9J1fPSLV6PIQzRSr
         gwrwppLQWf62TEjGdYv7NSLr9XOoXfOUymbnsORIgq6179e/1QgipsBtHGSHhzVbIIe9
         IjZo1sff8lsyTfLHngOI7GjZhFPZMMnJ+JzgDoZVtXzGR9ek6uV/LQByzvwzb5+DpW+9
         UD1uMVRPOI4wK2zFEjjLGAOmC3GqFjbQerAklbUhAZg9mnhxa37sscysiQQkwvOHrQgl
         YBifPxp1BprPyBT943pJ9R2L80cWj3s+KKI4D6SeKBCkKrFDKrNqUONAemHizUi59Rac
         pGjg==
X-Forwarded-Encrypted: i=1; AL+hErFtoqI0Dpwwv6waImoCo1Tp5RDU2ESiwo14Sg/zPe7huEw/m326eQjFU2OA3qLSFZb4INkdVBuXbe4+uyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LyXy1MsIhTXrCN6PRrhC3Tjw73buuhkhBMl4jPmvrr4HpUJ48
	9FxVlhdUACq2fl65FyKpBRm8dVtVXo2yLuw0OD1sYrlYfkhuqBUv4/KK49fR1hE6/IHi4/pp6E4
	49Kkz26JhIZr1CzfDuMrRrRIHNvhhjBoEUxppxp+hk4ONpdOfHIcRQrSWuIw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150b:b0:573:b059:4d5 with SMTP id
 5614622812f47-57a0a516489mr7011438b6e.11.1795274424280; Sat, 21 Nov 2026
 07:20:24 -0800 (PST)
Date: Sat, 21 Nov 2026 07:20:24 -0800
In-Reply-To: <6abc6763.80e1c6cc.1e8e5f.0082.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b01b6b8.44b41460.34b83f.000d.GAE@google.com>
Subject: Re: [moderation] general protection fault in dbDiscardAG (2)
From: syzbot <syzbot+0266f74df36ca702aedf@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	rokinthanp03@gmail.com, shaggy@kernel.org, 
	syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Sending this report to the next reporting stage.
