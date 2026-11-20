Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179822;
	b=hSkqsD5JwUYJ2TQyrqyMyeq7gfou+NtbX1cDRQdOTxZFjv6GWLdPWpMCXgl3PMI+0B5R
	 SgkaKTTcew5Uk9AQZHfYPqii22EfMRXk0nl5yrXTJYdfRYyFr7p6y8EEFN7pP0x6tAbPp
	 ti4BlPBRZueO7ojfg7ls5k94AMSd99KADgo8N2dUZvcjb2Ai5JH415tQl2z/HXp2hrv4C
	 iQwrh6W4i7ZesBOcjkoUZ1WrQk/CKw/wTY16qa36RJ/yMfbwS9cH+MIScYuK6hCxusk0S
	 0yRXEotaEqc+mWpqawXXMt4B2VJD7gYza/TQppCt4NlrYYgYxMKrUSqrK4UlcnaI/Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=n0ISsvavZIs94+cwCUE6Hl8OOGqoCs4DO2ZqytVibgo=;
	b=0Hzse8yJQsDOEvNPRg+9MEzRhOZIwEinosY0Rme95+kO5uBEpptpu5KJvyXAxbJncht4
	 oI5plfgJ26SQwfQrEfJz9v2yGkOh3vHprIxcpW7Q1CrtLIQ4XnbpROnbR/zpUuKdqYAxI
	 428cCeCOjONo0B6AyCqf2JiVV7gDZ1NTjScA4iY/dkOQpSIk32a9PxuMuAvjDhwz7go2P
	 r+WRVgok/5++okrTS5+foNpFHCHRowhAgf56gtJdx5vgPi6ZGwYufxx1ObRsP1bKR3/+l
	 Wx+dOXQXL5CB11a+ZUigzYSuR2+Ltz8mnmwFNWP2Ckjb0O8mua3rJKeadzsCqw9BI5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsPpXf3A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5ED606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5ED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsPpXf3A
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso421284f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179820; cv=none;
        d=google.com; s=arc-20260327;
        b=bA2eWbpNzd5sKusocFdqFGI9F1cGMyiAOMMG9bkQ+rBjsQl2uqUfgaEljNaVTKvibG
         zNakyqwNv9lIKCmsFxwZ+tCAzgsLJz7qcbtM3pbSmPysSGir4IbT4PRCK8aDcRk348Jf
         zdBJQ4vxnd/s4mWa346f8S92zutd1W7QddbNJfoJVVSdQA3UE8RLsh0c0p28IFkZ1msu
         WETiH1XckNY9HHCTt9Gh2/xaOrQmBxINOwk38aqlN1wtIE87dASVP8pyYnEDjBCtsL2Y
         wkii6oHB0Vg0WEfLc1EvO1Z32qOKOZYyL/8JG41ZZ1HvPv+WUX6UrmJ0PFrGmFvQ9nQh
         QkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n0ISsvavZIs94+cwCUE6Hl8OOGqoCs4DO2ZqytVibgo=;
        fh=kkD5+LteImBC1ZBdAZ5ftQjVc8YolxrIVbiQEIYYbFg=;
        b=LNeUWQOR/yRMiRcIkh8obC94EEtpuiKOncepkcocxQdL76K5FW9zkD3PeAuz6a+IVd
         hgUNZ9DPRB0vn7D1/WMGG6qIycZ3v5cere8j3lt4qjNiJsc4sARkXOeHckMLF0G1Ol3o
         x4C/IIl4DlxlYQn844SEsN+KFyN6KKHlEDnQZFH3vzxjz3wCP5hrFMn4WiacrfuUHbzz
         IakN4YGPYCLqfcJJdbs/RpcWQp7Ep2roz0/037TbFLcXonsdanfrxjhamrKwN9K+HZ9o
         EQ47ksXhrR9xqMPkBUjwNGSLy0h8OFSRd8J0ISUajKykdDvgI7YOUhETU2M3wJFPGM/L
         c0hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179820; x=1795784620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0ISsvavZIs94+cwCUE6Hl8OOGqoCs4DO2ZqytVibgo=;
        b=PsPpXf3AAmIVKkD46P0LhsoUBI3Fj75//V1R2+K2pEnYXK81nji4S0oE4cJ1Zyciti
         FpYJLB6Zmlt0vKPXnAra6ZArejGnwMukT1iVidcPas/tGmfPcaN89Xe+WR5ksyf6BVoB
         AzAp6oAzoJhdOylbf0EuSNr+lRUEoehvUX5KqwoJFhPj3qdgc4qdddiCOyxrPDtLDgDZ
         MJ/7t3i+jJ1nUEi0Ok+TFMs81Fjzui6ubGrSQiLwaX+CX0TrN3ekFEKP/Iuui4JWpiDT
         ckcquOTNzmvVJ1tSjvdTxhJ5LjQ/nl2E+jsICVyW/Cw/ybdRq1uhpcCqGWBGftQ9KT2E
         vlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179820; x=1795784620;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0ISsvavZIs94+cwCUE6Hl8OOGqoCs4DO2ZqytVibgo=;
        b=Z0jxUJhIHKVBdAP/jcZsjbcNLu7CetZl0c/N/uhTxdvguUzWYaEFK+pYay4E1rcZTe
         uV1PxTkX+p4I0I1UQvygAhS94KJm64q6OhnUwx+HGYrgdJJdq7iwVpLsMeVoPcsqKl3I
         xCAB8SgzK1komwScu/AGJCeINc/jUFBnkFPyA1Jds5zkksPQbnzuc6ScjxnPtGBbFUTb
         Er3aFkvRDPQ+51zBTD90y/55bp2A1lqC3w+FLDUGWDfKAmSbmup4dTBYIfbYvfoDj85Q
         sU9rN9+tQTuVSpJvCVeqluzTFesO+q4DNxvcar26iZLpkJrirwLiHWUNVivPzTVWGATw
         dcyw==
X-Forwarded-Encrypted: i=1; AL+hErEJolmeyDez/jGkwwuawv80gvFgBQOH+NqMt7XffLGVX9GWGLtHIU+aBBN+ZGDxzZmYAEni243Dh9QSDfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YYzClCge0k6l351b9WhPoj03JrOlDc0BRSXMejUYKZ3aUdBag
	IhZfo4knGKlK0LmmkYvwW5czx1QpPILHK68mYLEdQHqR6ocObwzxI3UQp+ANzraAK+uY9kmFs4e
	gutvKSTnHl4qQ9hnuCzsdJZxvC+XHXdQ=
X-Gm-Gg: AZFdTZfnlaiQ6LnQgxZnUJaAxkazVVDkaAvuVRsKGw8foM/lxAVCiRYW6ig3V8fNlpN
	C7T7DGAdjOIRkXhtckRfbfbLWG1VqY+MHbXwfqEB9JJXIDNUJZg7V6/XtEgKrCh5AA/gII4Esq0
	M1cCKYlytZFsSGcXEWESgS0IjfceTpAVpPyWsJoNSvmHSuFf+gHf/vR++FAmQtzaKT7bSrFx7c3
	trEipFaumrSqg+5VJMTlIvSObgSmXHf1MN9h+XyVkHv8D7rcFjNQKw0NpD9HfWCUWScfnQpfczI
	gSIQSbR/OPeoVHZcXK8kXZklGG+dlLx5lSkmpaatIonuwJ0ix5yLEZVinxoTwlqSo0evzEfLHw1
	4rw1qZ7/5Ljopj+v2uvl4v/IEPskUl5dUASeNfcoAJCQ+4c94p/GDGo+pWAD3eSBc+wBwuPW1tw
	xu3J22X6XPA2IpuxMzILvD8H3YdNrlempeekpd2jiawc9wVDmtNWhiH1NqQSw=
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id
 ffacd0b85a97d-4aba56f470cmr6596088f8f.0.1795179819733; Fri, 20 Nov 2026
 05:03:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 13:03:13 +0000
X-Gm-Features: Aa3M54r7eri6nG80Ox8qtxZ_YF9Vy7EOukLgs2cDYx6GnB44mJ7ZTcxn3ACOd0U
Message-ID: <CA+V-a8tunjWx9j47pZybGjBwiHzQzsxXWzrc0+3E4h+APGFk8w@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Avoid transient double accounting for delayed tasks
To: kprateek.nayak@amd.com
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	LKML <linux-kernel@vger.kernel.org>, mgorman <mgorman@suse.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, rostedt@goodmis.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,

Sorry for top posting.

The original commit [0] in dequeue_hierarchy() set `h_nr_runnable =
1;` where as this seems to be missed in the merge [1] which is now
commit 486c3d06b90240860e99686d29ed9f15637dc314 in next. Due to this,
I'm seeing performance drops while running tests on Renesas SoCs.

[0] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
[1] https://lore.kernel.org/all/179500916013.3191731.3149125419718630663.tip-bot2@tip-bot2/

diff from original commit:
---------------------------------
@@ -8317,16 +8307,15 @@ enqueue_task_fair(struct rq *rq, struct
task_struct *p, int flags)
 static void dequeue_hierarchy(struct task_struct *p, int flags)
 {
  struct sched_entity *se = &p->se;
- bool task_sleep = flags & DEQUEUE_SLEEP;
- bool task_delayed = flags & DEQUEUE_DELAYED;
  bool task_throttled = flags & DEQUEUE_THROTTLE;
  int h_nr_idle = task_has_idle_policy(p);
- int h_nr_runnable = 0;
+ int h_nr_runnable = 1;
  struct cfs_rq *cfs_rq;
  bool dequeue = true;

Cheers,
Prabhakar
