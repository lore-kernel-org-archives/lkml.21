Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244589;
	b=V+9BpN5yqXEYvIFhNTsB0ljI9wyNk4kFcFDIHAidOJdDqYv7op6avyK9R+Mkm+Z899C+
	 NvBN9SWJCpm/I95iaX6I+THO8nZmURiIx5FRgZVA1FX80ej22Rhnve7y4XT2252V/eFOG
	 i5UB/PnXoIwdQUhr8K9yTZ7JZiFxqWsFhB4W42TEtDANci5Bf06dIlDZG+GETWQ5jWstk
	 tFVWn/0C1QyE/LQZPvFEpRC2+hGeai73fLCDQG7JnldxexbzvR3fwW6QfArvoXSOttrC2
	 abeOFfed5fOj0hCohvoqyXChqpZStWC3kjfDLHMZ1dnZS4d7Saqoujka16NM9so4akA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zW1+nYJZJVczs+5olEiRlw7lVib+eaHnFXEw3TWYskI=;
	b=F0RyF0qwFw70JrAyYicWA+kKXMlvKTAkrKdSQuTQDFdBz/SO3kIWFeXFR+7S24FrDQx2
	 VncJwyqvgk1v3lm1v6Ww7fgMYCaElXBy5zB1YWf9XfkHEbIFeJ4ffMEg224P+VN2KcxxO
	 xRdb0xNxaNBpx0H6HkaQb/nY9SMFKk1YO/oLKXndrWAuAgSzF5m2DU27Xnh+N8NTNYznZ
	 w+9M3HLQY9Kn6zz9bSiBx9D+VCw5v2FINFagIGAnQaVqzNqB/rFMmSFnbuSvH9iXq2U/1
	 7TfH3raSN+XgbSi9HjG5UELGGRhynqeISTjDHiJl4imJlbhdLMjU8EeQpqCyhAgXtvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7FIEMXG;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC9606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BC9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7FIEMXG
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso722969b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795244588; x=1795849388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW1+nYJZJVczs+5olEiRlw7lVib+eaHnFXEw3TWYskI=;
        b=A7FIEMXGXU7JQe2/BL6p6Ypv/aRiY+cbVu/eneOSLdvyHAM0o3KpmPYHgNQ0GGKOxW
         GFMGRp/G+foiQ68hypYnN7qlZLsbXkQb9s3GWrSc0ETMHllOFs6U3Va6tEZ5Nf9Q8luN
         I8YAK6xXb8qEcEqD3S9Z0nSblMMzzp4KuWE37UyjqVnOSeI0SKcBoNspsTcxMyDSAOdW
         GNDguHhu02FTfQNAuCYtmCiYR8LoeG1BSDtyHjHXdG+h2eoFwGa7/t5Kfc22QSibtWw2
         5usaOl/GGEGANYDiM80/d9tqeZAsTrzyguBB1xqCo1Md0tmPKO1ATgQuyBsWkem2Nkub
         mVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244588; x=1795849388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW1+nYJZJVczs+5olEiRlw7lVib+eaHnFXEw3TWYskI=;
        b=HpI7M+Q4yPhoLflsBkjeM5fHi9yhJbOqRO7JIEH1QbneMorZM87dleWdXNjWCfpUMC
         PF01glDn8hxQJ1s38MVU3PEYoIQp3d38bpXfRq8cIeA4L4akj1agHXseV7CFSGoVvGWU
         QAKsnJC2TteIm0ps6KKTS8IIt987b1q6eOVluKcqRcBykaS+SgNQxtniHXQCG1TOhbSi
         CfQVRMuJ4PRMKnBoSEFYoF0JgQ5JXMEh0ETo/ClOGG/9Ws87sdufCkkpQJ2FgcOjMbxV
         fkG5mVCvpJ3/yX8S8SXY9kmJRgTscANs4qvnSbq/KrKS/lwFo4mtqjG5Zsoc3VIpURQR
         lbsw==
X-Forwarded-Encrypted: i=1; AL+hErH36LouURTpJI5wUwcw8Pl9vsMBHKY3hDOUBva8/FRCnD33eK9xGNFl+oTs/AhLjfbjR/w1a1EKyEMUU0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P3P1EoKtJzPTOnhZjhQbav66PfqOzIjZIHUK/1bZi+na0lSjN
	bYtkaiiDCYlJSudMbGCg5KweJkqVGBm9lvThllnZy3n39HMpXUySqb8l
X-Gm-Gg: AZFdTZcQvZsfqcI9oH5OFVWWK9w60aUqHaUDhr4sBinekor/yMEx9fIH7FlP7AVHQ7U
	yd2F0uCiJUTldT+J53hbnJVj9QIxAjAs+OiNucm64SQeIlcFIXyP3GvFI7fDRVVWKZZJVhnKoRf
	GEYrx+TeSA4qKj2O65igANqTo7ksuZkQIIBXsL5fAYKwjzMqCsdC2WucbPLaa5+LLUhq7wY9Lie
	db4pq1nwwHyYChXny75XfBBSlrEUHx+dFrx4jPU7WNr10QhXI9CAG7JDm78R0yEGKR+Ds6TQLuW
	JHPXqaQuMC84sQeebP6c3m9XB64jBmiogX0wYJqc9g2t4wAd2CADuTavDXhs20GQSIrt7hl3vfb
	xPsLQ2fui6a23rApnF4uAIZasFeZPiekoZKYQzBd1Llr/L4qdGvL3h0Wt1lYqlGFY38jL76tbvb
	oudxfOmEtJnUnrNVtxU2fAbQV8dqwcsZSW+gOMep5fUluTx/mIZr4veafb/1WUYGftorwUwu857
	ZP2tgQ5oWBd00lRLjG1hlGAW165cQkZ0cehpxjsRClLOK4BAWaaImbNLJZXfg1XC0/kzlONiPs1
	EoJt8J0Sd28aKDXJfMoN7oGg
X-Received: by 2002:a05:6a00:929e:b0:899:3439:c8d5 with SMTP id d2e1a72fcca58-8c87bdb5470mr5246786b3a.14.1795244588208;
        Fri, 20 Nov 2026 23:03:08 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm2477793b3a.13.2026.11.20.23.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:03:07 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 2/2] Bluetooth: RFCOMM: Close the socket before transferring its DLC
Date: Sat, 21 Nov 2026 15:02:52 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFCOMM_REUSE_DLC changes the DLC owner and callbacks to the TTY before
marking the old socket closed, without waiting for that socket's lock.
RFCOMM_CONNINFO can have passed its state check before this handoff:

  Socket getter                     TTY handoff / RFCOMM worker
  lock socket; check CONNECTED
                                    replace owner and callbacks
                                    close and free the session
  follow dlc->session->sock

The replacement TTY callback does not serialize with the old socket, so
the getter's socket lock no longer protects session teardown. Close the
old socket under its lock before replacing the callbacks. Existing
getters finish first and later getters reject the closed socket.

The excerpt below retains the headline and stack traces.

KASAN report as below:

    KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]

    RIP: 0010:rfcomm_sock_getsockopt+0x60a/0x950

    Call Trace:
     <TASK>
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_rfcomm_sock_getsockopt+0x10/0x10
     ? __might_fault+0x135/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? free_zapped_rcu+0xd0/0x1e0
     ? __might_fault+0xdd/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __might_fault+0x14e/0x190
     do_sock_getsockopt+0x342/0xa20
     ? __pfx_do_sock_getsockopt+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _copy_to_user+0x7b/0x90
     ? srso_alias_return_thunk+0x5/0xfbef5
     __sys_getsockopt+0x113/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __x64_sys_getsockopt+0xc2/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     __x64_sys_getsockopt+0xc2/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7ff8b2e9007a

     </TASK>

    RIP: 0010:rfcomm_sock_getsockopt+0x60a/0x950

Fixes: 08d1914293da ("Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_state_change")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/rfcomm/tty.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index 198c7dd1a95b4..676fade1ee8dd 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -286,6 +286,13 @@ static struct rfcomm_dev *__rfcomm_dev_add(struct rfcomm_dev_req *req,
 			skb_queue_tail(&dev->pending, skb);
 			atomic_sub(skb->len, &sk->sk_rmem_alloc);
 		}
+
+		/* Finish RFCOMM_CONNINFO before replacing the callback
+		 * which serializes session teardown with the socket.
+		 */
+		lock_sock(sk);
+		sk->sk_state = BT_CLOSED;
+		release_sock(sk);
 	}
 
 	dlc->data_ready   = rfcomm_dev_data_ready;
@@ -389,7 +396,6 @@ static int __rfcomm_create_dev(struct sock *sk, void __user *arg)
 {
 	struct rfcomm_dev_req req;
 	struct rfcomm_dlc *dlc;
-	int id;
 
 	if (copy_from_user(&req, arg, sizeof(req)))
 		return -EFAULT;
@@ -418,17 +424,7 @@ static int __rfcomm_create_dev(struct sock *sk, void __user *arg)
 			return -ENOMEM;
 	}
 
-	id = rfcomm_dev_add(&req, dlc);
-	if (id < 0)
-		return id;
-
-	if (req.flags & (1 << RFCOMM_REUSE_DLC)) {
-		/* DLC is now used by device.
-		 * Socket must be disconnected */
-		sk->sk_state = BT_CLOSED;
-	}
-
-	return id;
+	return rfcomm_dev_add(&req, dlc);
 }
 
 static int __rfcomm_release_dev(void __user *arg)
