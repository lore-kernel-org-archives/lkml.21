Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786210;
	b=JS5CXJfxaYrSRSF2nUi0emuSxMpdPK2+cGuzMf8czHBmtb+p2P/WSPXFsnYuFZefge8m
	 u8oKKAgdN6cDeO0raQDefdlWE+RL1YbjXOxqmUqlE4MyXzw3YftsRATugr7T0AYOufSgC
	 EHUAkkisp7He9tpqAwfZrEPLNGfjqckug/5NFCXd4lqgRg02CEg7f7+NKafABn3r9dpet
	 c7YYcmFvsVC9nHiC9IZ0Ku2hRt9eQjUGtcNV46mbUhIeJnnnZujn3kWdC+BTBUf5t+2eW
	 vB9m5mGef3x6YgQV3ylyEjX+H2Hj1n2c4FyalMfEy87y2n1opxq7ievG/tcAhemO1qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
	b=WF11DvZ2OqcKgIQ/q5Qk0IhidqqVO2BIY870tcOA8HKliYp7lO4NKZFOw5nXnGWrpgOL
	 8yJLs/WrIuWXaEYJibdfBSz0pI38Jmasqe4WmTzJ+sXEjY9paFPebYnD/SPeyaE/tia6I
	 Y5gvqEhspFsEyqjmpq2LDJFqwPPhz0/VcmYS7IEq3RvszRYjiCBEu1zrem6H5Lxm5Zj3T
	 ecHkJFm9U5iDpY7tjvMNQG8UOe+JUqkemT/2v243e58jtLYwK81tjWECpyrDDmyRIVGtQ
	 vumq6pA/j20GHC59Wh15h6R7+GAAGwhFRvXjM95Sw5MwwxHCYO1HqPzTWrUCgPwBWAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owqBHRlN;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5DF606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owqBHRlN
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c51c294cef6so188718966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786207; x=1796391007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
        b=owqBHRlNX9brkGoupsEPjMJ/YOe5lVhkLo/R9Ape0agdoJUGcj2ExyeUSwfMGX6Nz7
         2LcQYtu76kPD6ODzJ9getFml9dOdz0wAtt4C6kyFLCFZfnNxe7TBtqmfLGPp1+TmNqlp
         r9uTNr+YwKSZjooyoTs21f/DgEdf4sfO2HH8YxcE5wxQu/GEZqn5LKb5SBYzTu05RMtK
         DQaAvJZxNIBy9+RNQkCGjKhViN3qcXR0xyae8Lf/aZBGPTnNJO/ZOP+uRgpp+9+03pDG
         UldGb+IJjEnxlgD+WRjhz+0W+/1s1e4okaKkYWl2eOOozREzVNMC6Af2Xflu2mbRgzJK
         +iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786207; x=1796391007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
        b=CWcrJumAWRq+WHX1T/9IHH6AP1pbSE5NDhQYgJQ2IYv8UPnCzx0xJd+/fdXxxqMq/P
         BLOz+xY8KzidCy/nQuJmEJvO63jNoNutlVa+NE9foTnMZEpTIA8lkg/TQ389Dd496O4H
         +BR7bR5IRJAI1J0Pwp0FhuWP2L7TXQMbW6XUJJE+uSOJqHQy2ps6rrOOT5oLdeY4TLD6
         lgMtuw+7XKMRykHjnEERGgfGUEypo64+0IGqn6ANpmQj3XGTSX+vVohk9O9jk/jjAijX
         NMv7D+oic6O66iMYl5xOIbEt2IQK5lCc+o89HLwiVyxMDq1oaGaoG9OHDcHW73RbqSwd
         +/tw==
X-Forwarded-Encrypted: i=1; AL+hErGhXqO0FWCCVDEs46n3PQ6R7yLK1ewu2+5vMo9uC/npwdDFTRdyIg9SM9eipvOAho2MF1Raiih+ZQUCfQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k8sYHRe+pFYahAAPu3wb7DUdZMcNoQ3dklguuJgvixZv7b882
	VyrGCo6+wna62WvJYbICc9okigyw0G2VXPH35op4vGScPbriTqHohoVJ
X-Gm-Gg: AZFdTZdyYHEVADuCZvYis9ICvkz1tYO2Ta4mJSDX8MUNgMfjGnQ+MtqdUipGU7GamsH
	dEhmFS1AUBNZEhWGXkfWAL2XhIrVQhS1KfMMhOYGnwOkaPUQSCg4q4OvlMj1XFzaNpRyLON9qp+
	rojHWq1ysEAJgBwOm32I848GDo8YVMtVAttlFqIjNTi42f/lSn4cA3PQrHshYPAdzChWQr3dK4R
	z4vgSUsMfcCKevEeLXApOh/uTDassLzR52yKr1qsIShu9L8G3M00wfNCxY4ZVHjrwrTDM4RVoq2
	WtdZdOUI8GRsY6y20QAlyuDq/Uh84tLNWUb1xqdVNyFV9AUBvft/xvFx6v2+HWiZ4PgANjHyZAc
	FNd4ZCkq3tg0ZTA1Rf3c/al/p54A4BUfZTQU6a5C10DzKUUA4/eDFBw/bVCdUtgxB9zYp9A7fjj
	1u/kmgWjoJV8rwf1sV9ZsQtVJVBMh53CT00D4I6tbVYuP49O3eiNANnxl/3K9wvQ9jC3NU96Q0F
	FgQ+w8MWCksPCHSRhe2xHDrvPoyoPmXIBNE94YsO35DN6NYyBUZjxphcW8IbEDqEdAE5EcqP5Qd
	KVIfRNV9t45qnBzTTGAeWx8hYBUFVOJ5HjamYtlFptHRSdCk1CIiyjS6sw7jusIXsgex1nbH7SX
	63DpSMxDrRS033qEI++NxIT4K+R9VubGt/U+fVq5jSbNYtreEyQnJjAGsfedRzYG44Phfdh+Vy3
	tGBjT1WyE0GpjbeK0ctgomQQpl2ZZ9mewfVa3yv3R01su1LBSrhjIIsvPPlc7USCg=
X-Received: by 2002:a17:907:a890:b0:c51:24a3:fdcd with SMTP id a640c23a62f3a-c513aace71fmr2108908266b.17.1795786207212;
        Fri, 27 Nov 2026 05:30:07 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm859101866b.57.2026.11.27.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:30:06 -0800 (PST)
Message-ID: <5ad2c46b-4ed9-4689-950f-93753fa1586e@gmail.com>
Date: Fri, 27 Nov 2026 14:30:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] net/x25: don't call lock_sock() from softirq
 in x25_kill_by_neigh()
To: Martin Schiller <ms@dev.tdt.de>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Lin Ma <linma@zju.edu.cn>,
 Duoming Zhou <duoming@zju.edu.cn>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>
Cc: linux-x25@vger.kernel.org, netdev@vger.kernel.org,
 Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 Shuai Liu <847807867@qq.com>,
 syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com,
 syzbot+9faa82ae2e94c5c7d2ef@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
References: <20261127-x25-kill-by-neigh-v2-0-c7cdcc9f1320@dev.tdt.de>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <20261127-x25-kill-by-neigh-v2-0-c7cdcc9f1320@dev.tdt.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martin,

I tested v2 on net c5de2ce2fccd in QEMU with the syzbot config of
300375dfd44665f063a6. The syz reproducer of that report and both
reproducers of 9faa82ae2e94c5c7d2ef hit the splats without the series
and run clean with it. Link loss, restart and NETDEV_DOWN with idle and
owned calls are clean too, and your tests 2 and 3 pass. The same holds
with the PREEMPT_RT config of 9faa82ae2e94c5c7d2ef.

On the question of the netdev bot: patch 2 fixes a bug that can be hit
at runtime, the x25_recvmsg() case included. The window is narrow, but
a test can hold it open. A second thread owns the socket, stalled in a
userfaultfd copy, while sendmsg() or recvmsg() waits with the lock
dropped, and a CLEAR REQUEST from the peer goes to the backlog. For
x25_sendmsg() and x25_output() an RR in the backlog first frees the
send buffer, and the sender runs at SCHED_FIFO on the owner's CPU, so
it gets its skb before the CLEAR REQUEST is processed. For
x25_recvmsg() the CLEAR REQUEST follows a short DATA packet and the
first fragment of a longer message, and the receive buffer is small,
so the fragment sets X25_COND_OWN_RX_BUSY and x25_disconnect() purges
it again. Without patch 2 all three end in a NULL pointer dereference
(trimmed):

  KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
  RIP: 0010:x25_sendmsg+0x8b2/0x1580
  Call Trace:
   __sys_sendto+0x48a/0x4e0
   __x64_sys_sendto+0xe0/0x1c0
   do_syscall_64+0x125/0x7a0

The other two stop in x25_output+0x51f, called from x25_sendmsg(), and
in x25_write_internal+0x26f, called from x25_check_rbuf() in
x25_recvmsg(). With the series send() returns ENOTCONN and recv()
returns the data. I can send the test program if it helps.

Tested-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
-- 
Krystian Kaniewski
