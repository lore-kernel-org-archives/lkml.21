Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285935;
	b=JBAUp+uHbmiaGyI58vCxQFynCPODvVjElkaxvxqSYcg93gbzUk9E0z9gW5NJPIqo8dbm
	 FKjP9RE24nVMe4b9/ZhkCLq6gnWNZ6kNO+maslHnH4+G4z/ycxaedu+u1REJcWBph/xCF
	 aSZGLMLcDFeaHfaEHLWpxUwU+LixgOwUR0h0EcaJAwFGmZivNRy4dNJpKbqLoFF4672Pr
	 oPp5wgD8yXcU9cmXVoIvMlkVqDm2rj7w0un3BRznXORbD73c4STd4zJldEkNcKzihOdcw
	 JDSlxKAeN/j5DoV0fOYyJsaNSKSrwCAs7orREK2EhjcnLsCU1CbZL/nWJFCTpcIv3Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
	b=dtpvQzQi6GQvvf6kfQx7+0uO+1BvwaBQ/Fx29sd6Kcv5SZ7sWb6ewZFI122gROjKqlvR
	 SdWO2G8CMnOGuqyUZyZugUlFbhDwLVNdBnvBm6oKkbczLDr/Tp86P6czY69DT86w3Zcf8
	 KTEZXx9Ugw3bJcgK3dv9KmekxwxH713QVN5MVzICTyEGB0WeFEgsCWqirJLqHbq7+dbSZ
	 d9RrbI7eYWSPEIrWf/U6R5p/WAZ1hdDIP7dhbkKAGV5PQraSRD6Uaa4MNsnRRiCYHxZjw
	 pA2Hs1zCycwpa62BF6HblsK6x68C/sOe3AaOza7xtGJWAbI+1KXpmBqIGjvnTMPKIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67695606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67695606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so1912513c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285934; x=1795890734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=DaghztvbDwmLFkrHuo7a/sJTEMIbMPmqTCllt3YXXs5/QvBXSOdXJqhVDvN8JLxAn0
         Vriw8/p4M1Guwy4T73CnQNyFoXuwNeLiyfkeQxsU6imRnXU9tQehTBTNWUntjRpNOnmt
         81VjVdUMTWUnSOsb6oSsyLdzYGp1/peaaANrZO6Z0YHZRiHJmCYVw7lm+R+1lAM23u0B
         2XQ+EBzTODDyCbn7xTfv0qbjMsNI0g0OwlLQ9b6SaiVFY0RhrvKqDHIKkpGzbbRioG7Z
         5TG/C2jVnysrVLiW9jEyHjBQO8xtX71626/ZYM761cudpBrdY6lAEgVsCBaRu6WR/0Or
         mQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285934; x=1795890734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=Kf1P/5MbLKbd4aNUPf0K6h4JafHOVpXycSr7WeemPGbpzbNUwnoDHuLi+c6ECULtND
         MMmqCNc6xcEebbt6cS0//V7Zx65BMwIHNk1N76qIW3aWipSoP05SO6AxvjQ9ype6jS0K
         owy8O9h6SCcWqw7Q7/Fx+FIgAtQE1tKSaF5ALwRNpAh5txXcNV4moLbs2wkzM1hr7uF/
         NTznIg6RL3ai/+kMANNOlzD9YmRksd4vLpOgVpLFETscfSeb1XVQT6fBkAbQ9YTO0QEY
         QY2U4Yh8gVvHRmmVZaCgW11XhS94Mo55MwwzYmEURQMohBgzJdJso+L0ZC7WRwhOZ+TE
         um9A==
X-Forwarded-Encrypted: i=1; AL+hErENGhFGaEkn3XC45QdyFmb7TbaO8SoOrGS/ug5HtNDFFsNfuEuDYLQf9vhq8mzZoyxIWOkfojogUsY44cA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZAZhIIBlT1S6Z5VcMhV1dKNzLYcW46AG56gSQnO6aIZmiwKLl
	lg/45GE6Uy18q+6CTPdQIpKTNonOWgLBmU6++dB8w+kfV0PyUgdlV2qwiL9rTPdcM7mj4KOFBua
	81bowiA==
X-Received: from dlbrl27.prod.google.com ([2002:a05:7022:f51b:b0:1b2:375c:827])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f516:b0:1b5:1a41:f3b6
 with SMTP id a92af1059eb24-1b5567b4783mr5725838c88.4.1795285933762; Sat, 21
 Nov 2026 10:32:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:32:13 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
Message-ID: <awHjn5AXWjW2qMPw@google.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: document black hole detection for tcp_mtu_probing
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:52 +0800, Yongjian Wang wrote:
> ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
> 
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
