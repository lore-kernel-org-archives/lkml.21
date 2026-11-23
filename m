Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407785;
	b=Y+sRXcHFCyS9FYyttb0v3L/QXIJHKMmJd+GnMZ11RzHSCuJUQOfzFcEoELB0ylw8EYlv
	 a8mMUPJNndRSujxxGH4hZ8Ewss3s4bz08kwTvq5uU/b7jkMSULY9zCco0yoP0EdpIrfTl
	 5GfyPsoFwZEsWlb/FvXONbUct7bDonLNTayjh/k0J5KjbLx+Pncwqr8U7FCHwxeiP9DkJ
	 5KTvQxh/Tkn1HYaJ1V7YK5pt6W3Md1yxirJC/hE6VwGyu/1IgRR39J/PmeK8fM/ktfX2e
	 eF0rFJJkJ8MY7nRdyzsAnA/gYhNkhWCaATGICyUBa4MxCz1IFy5i8zVDFy4ekpiqZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z7nPTI5arwtfLvJ1u0SNc3tfHxfngmeM3rWmqkRPFe0=;
	b=jARieKFadjO+HSbFSHv9pe0ZG7Dkgl8ZpFBNhVkSU7B5R8UYN5Qspch/6Upg/6sALm6V
	 X0fMwL+q3kaC2P1yo/REQ8CjG0AnnsQFgrTg/3CLm8yTq3kmbQ/0qjX4Q3rJifhHUAQ39
	 C5kKF6DEV0WJ0FJFxXlMAkuNpjZAUCGA37xhQ3tpBlvuExZJCpgvQcec5vH3uBNgbNFMq
	 I1p1/vuabVzMeGk18Z8S4PrJRXBfW847H7JBhKVwa/n37j4/MpEihUbld+rf7fJ+9fzhq
	 KHGL1YhprGRsFfiiDAa6OdjuxjcNnpDSB2GMldxZRvEqU2fT257Eb3TjmJ6Kr5h/0gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Akvb2KTo;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A4606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Akvb2KTo
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9495f083657so345651285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795407783; x=1796012583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7nPTI5arwtfLvJ1u0SNc3tfHxfngmeM3rWmqkRPFe0=;
        b=Akvb2KToJ3Ak1XsuDnYKBtbnhh9DBx5jCOEwkXgnAWKJ1gOMmH78uj2GxxBO9gCO6t
         GMt8G8Mqg3loK9qNScCW+6j/7XOvuTeqYCQZlHM1+earUWSLsh/SpnyfnGV70d64iCPn
         6hvDtDHLV1GNruB06Gsukzt+tYEQ3lamByTnCv3vBIwLPmRqUNcdQl1qzCVH9tnVjpXu
         3zp+Ixy2fD4tL6Nyl3HL9sKrUcyufJGYp/c7X/CwpDeNtlSJSGClfjEqPDCnzSGwdrCt
         Q4LD2xw+qGpGsL1TrBKx1iV2YizypbOUYUfiSsq6Shnz3VoWUz9cg7SEZzBRjnTSABfn
         9BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407783; x=1796012583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7nPTI5arwtfLvJ1u0SNc3tfHxfngmeM3rWmqkRPFe0=;
        b=EKcSnkJ05/tFBdnbInPTCP82xqQ/ghVzT1aBLvMwpdUUVsuLr1zngoRO2iZhbyLowz
         AXHbl6L9ZA1GlNwvGxpygB3Dp4rowTp9BqaOnaQIxEuNOtx3K6sJCRy+g3RrskFf+fWy
         5ZKTI+7TSu3xlxHEtlYUvIkUHrxNtWqlyMU4wPxelkmJlUfTQ18/KyTXqsqWLLoBB/81
         nrJhumAWFNCKnGm4yqA76+/5YdTyKBDuH4MfoyQ0ca8glz7u5w5bDGZXO08ZYDfQ8/6T
         P8XlrhkyF38zasTihs8ub+3BdsFW0sik0K6TOs7sh6UN/xZ+Nazp45qkTY+ItWshwo4l
         fXTA==
X-Forwarded-Encrypted: i=1; AL+hErE3F0dEZbn4L/Wjsv66LtOQesCUC4sB3/HEAPPw46Ud8ViuedOzS8rsTy2JNQSqOk41PUHE7gxQzXAjwRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PpgAzzhksIypgw0VCNo8n46tOMIPT/kmsTcHlzMD49WpQXqNM
	2o6BjOvXgDKrJTtQ7IbafDgAU5kE4m2WuZffLsa4BC26a6n3oZxw/Sm5cet/8w8jeiE/sWrkcs6
	eINjQMQ==
X-Gm-Gg: AZFdTZfcjLxmRH+i73YjbcXvNlf2vCf6Vz9pyaQWA89jv60+nFoSOYkdUapWKoTJu9Q
	gfUZdpVMzFBa7bQ9rRwp6WSpsEweDNoElpAAfztpaT88IF2lpV5E+dr2xw9eDIl9GhNmEWJi/2Q
	vSjPSJbtRpzZu5NnTkPNZS66P9HxOUaHs8GjwVtd54OnFq2M7nYdbyI6m0e/kDwVvuAWMqn4MR0
	rbvI1UpgcgI7g1VumKRj3lt/qbC92dWlzDZV1JNoxkwtYLTU9dpqKpgzQnc8tXydqcceohhF0hC
	a3GOmJHDcau0C0X9BY3k3Ub67H5ntAa3jh+HuP5Ov461InKhG4N1+5oWGhHMtevH1y+txJmimsn
	r9d8Hyv9t5T4F+sIBYjYXR/AY06Y5UuYScuA/zTj4jQiOB30x+kuExiqA0Rcgx2kTSPBYoJmJ0E
	5RGL+r0BOl7GZlNrv14lHvx+PrgHhZZLbH5s8E2aWsPY4+D+q0HF7LdVDb/JepJsKgTtm1aMnSZ
	8jDl0vfhovlm4sLC2faSWv2cqk25z52fj0OIeQIzZqi+kzgo3ooYJKRqH2Fc0gdeCKkPO5MCZuN
	jgjVEmD9nifitpF6XPkv/ZyJcaUeLWxN7zvgbcyV987F19GZWYob
X-Received: by 2002:a05:620a:4397:b0:93c:8e3f:3036 with SMTP id af79cd13be357-949ba827abemr1807820185a.4.1795407783349;
        Sun, 22 Nov 2026 20:23:03 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a38bsm717421185a.13.2026.11.22.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:23:03 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] vhost/net: ignore extra words in VHOST_SET_FEATURES_ARRAY
Date: Sun, 22 Nov 2026 23:22:59 -0500
Message-ID: <20261123042259.3484334-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 333c515d1896 ("vhost-net: allow configuring extended features")
added VHOST_SET_FEATURES_ARRAY. The ioctl reads the number of feature
words from user space, copies the words it supports, and then reads
every remaining word, one at a time, to check that it is zero.

That loop has no upper bound and no scheduling point. A caller can pass
a count of U64_MAX and a pointer into a large zero-filled mapping. The
ioctl then stays in the kernel for as long as the mapping is readable,
and a fatal signal is not handled until it ends. On a v6.18 debug kernel
booted with preempt=none, two such calls from a non-root user, each on a
4 GiB mapping, froze a 2-CPU VM for 56 s with soft lockup reports.

The check is not needed: the extra words can only hold features that
this kernel does not know about, and they are never stored. Drop the
loop and ignore them. A nonzero extra word is now ignored instead of
failing with EOPNOTSUPP. Unsupported bits in the words the kernel knows
still fail with EOPNOTSUPP.

Fixes: 333c515d1896 ("vhost-net: allow configuring extended features")
Cc: stable@vger.kernel.org # v6.17+
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Drop the loop instead of rejecting counts above one page (Michael).
- v1: https://lore.kernel.org/r/20261122120919.1718445-1-hengyul@cs.unc.edu

I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on the vhost tree at 44293796526f with KASAN and lockdep. With a
count of U64_MAX on a 1 GiB zero-filled mapping, the ioctl now returns
at once (before: EFAULT after 27.4 s), and a SIGKILL sent during the
call no longer waits for the walk. Counts of 0, 2, 3, 512 and 514 with
zero words succeed as before. Unsupported bits in the first two words
still give EOPNOTSUPP. A nonzero third word now succeeds instead of
giving EOPNOTSUPP. VHOST_GET_FEATURES_ARRAY is unchanged.
 drivers/vhost/net.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 631855064b3d..f6b59def4a21 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1802,18 +1802,6 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 		if (copy_from_user(all_features, argp, copied * sizeof(u64)))
 			return -EFAULT;
 
-		/*
-		 * Any feature specified by user-space above
-		 * VIRTIO_FEATURES_BITS is not supported by definition.
-		 */
-		for (i = copied; i < count; ++i) {
-			if (copy_from_user(&features, featurep + 1 + i,
-					   sizeof(features)))
-				return -EFAULT;
-			if (features)
-				return -EOPNOTSUPP;
-		}
-
 		for (i = 0; i < VIRTIO_FEATURES_U64S; i++)
 			if (all_features[i] & ~vhost_net_features[i])
 				return -EOPNOTSUPP;

base-commit: 44293796526f4343639f87b2acc53811c78b5d54
-- 
2.53.0

