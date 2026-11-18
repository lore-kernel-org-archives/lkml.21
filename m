Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009504;
	b=LUVKg7BAZCb9WGjEm1fodToPOKMorW+Le5cpay76eJMMYVdpXD87+kHr7H16y5y2uF1N
	 i96q8ZIss+tOmRhDYR1/PNlOTNFhjLymIF7pwGJZvR/cQO1J8MHOHsgaZJi2dY9+88Y7h
	 jfCpSF154hBQ0/aBRMkBZJx5ZoVgW9X4w+k7t0czqGzxiHuSV6GTZt7eXMCrI4wE3v8FM
	 SuJrCp3W0y+OMd4xT2QAwkgUMmQaVBSq3MD91TysbLmvQUIsth0Yc7XxWzjnzL7F/eER9
	 j0ltPspJCwkTmlPBDvpzyFBkc3DU5n0U2+DR6j0tmts2+x4gIHrgn/tdejFORxjjKYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009504;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=9V9in5V+oYatd4P85WPzdb+jeiCieCJTniKDwY0qcm0=;
	b=CqeqxTLpsTA4XMAr+eshERVODI+rAesp7Ca3hBA+UpjhaFtVEt2ozNiFN1xJE+mTF956
	 Q1JLqrg6SY3/W+pk0QJgwzNfy571myshZ1NlBBBDRghoT7RRUzk1ItWvNyEMBb9L9DG+J
	 SAb94EC+U8lypi7o37OdXvIlH4aOfZawKsrvo10ao67n2yv/FGdV+5Moucef4C5nvHpYo
	 GYJ96zkeeJ3YsuIeEwkeHglXvEzeJm82681ij/2aAJToXOQlN0MVgkioIIhUoeR8lbPcK
	 nW2yWon97kkVLEz4PrIrl7q48L+LCmxMolRZ0Nz70rV+biPggwFfsA6LKyzrkPU73XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/KmmQgN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93460A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/KmmQgN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795009504;
	b=s9CQHxF+bWaQJsdqhaA5N84hSn7SmR/T/cHaQmKEuhpoaUAcizSQcvj1K3fDoHXsOkhS
	 4rnYAQJ2kTSFdhhGx2ID9tgmDa3TpfOCT8ncG1mtUjCcFdim3TcfK4VoShtOubT0FVTtU
	 Z7CXByfumSCZ9qTBRj29s8cRVTxvnO3KmsYIw5v2WzJxKw4noObqgJtQxbfyFY9XXowci
	 fd0ZJVrnGqQ9IiGxLBy1WnS5i5tHe2ibeSI8/itrWJ9by0DR1gHt3TD7JNb5E2lcXZ274
	 vSqDQewOaXceSbgymh8iikIZ3Hkxwc91ujt1JjBVGd6ZaFoIMnDgbrZ/MU7wKcmyvYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795009504;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=9V9in5V+oYatd4P85WPzdb+jeiCieCJTniKDwY0qcm0=;
	b=m91q8hPDyQv1Wt54WU4G2dDuh7xOG1ldytEm5ZtHqU4zpdC0nDf9M8dNVrdhTngbBdHR
	 hUP2CGMUoEf5HLHg5CZ2wH3bmUaLU4OppwyIh11WoxSYHT4qb+m3hm+8y83zxSkVxx2ID
	 /CSxD2LC9Wme6r6tvQEpcH13m6fpdUAsg7BxRyKJB1L6lxZ8SGW4+ws+PHFS4six3npNF
	 +Bqb3ecpinlKzUXYRKfrf2i6gtH/VQ63PxrxecLlkTVZj0Ko89bA7uvSANOki2IT4gfbv
	 Z9nVYKP19tfS10ubPPVih8dt93WGl8XKgo3+FeeBdA9PbqhpyuOoC/ZQbTRA4f3M6EA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6E1C1F000C4;
	Wed, 18 Nov 2026 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009504;
	bh=9V9in5V+oYatd4P85WPzdb+jeiCieCJTniKDwY0qcm0=;
	h=From:Date:Subject:To:Cc;
	b=I/KmmQgNM9A5idbttVtmLYdlL42wD7vqQLV9LQrATxygndVnVXLZQZj+4z71B2Vg+
	 lGM8cvyB8/cEFzFL+Y7npBMd/wKCIvpUkt+l07VXJ1g1oPgDUcOfesHl1KqKTNO/D/
	 8PvCf+yEGLoaiVFuIhvHuNnQiYvJilcVMskJHI+b5KhpNI5wyfDTOm66Q4QmWWfd9o
	 YpHPhaxbTEOb7hIvZ5QX5yZWkPrS1CVTtC+BUvoHKJV13cFhxIw0TZlW9RZeBa6VTD
	 dBFg4dT7Csb1Jft75mh2KGyKG/PJZKlB0WOK2gYuuhCHWARvo/+kZ+D3Oxh6wfqDka
	 bznIkr1pVoboQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17F044ADBC;
	Wed, 18 Nov 2026 13:45:03 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Wed, 18 Nov 2026 14:44:44 +0100
Subject: [PATCH] sysctl: Do jiffy / ms conversion in ulong space
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-lklm-sysctl-jiffie-ms-conv-v1-1-bb60e5101418@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMur/WoC/x3MQQ6DIBAAwK+YPXcTIFWhX2k8tLjUtQiGbUwb4
 98lPc5ldhAqTAK3ZodCGwvnVKEvDfjpkV6EPFaDUabTWluM77ig/MR/Is4cAhMugj6nDXtln66
 ja+sUQQ3WQoG///w+HMcJND1T6GwAAAA=
X-Change-ID: 20261118-lklm-sysctl-jiffie-ms-conv-708b96e4590e
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 Joel Granados <joel.granados@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4096;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=cvT9Z1VwMr5AX7VWBnNxERQBI/gspsX2d3xpiXPpo3Q=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGr9q9522ph5NaWuU0hIWdArP19DxUNdXP699
 FB56xaJCfvkK4kBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJq/aveAAoJELqXzVK3
 lkFPRLoL/2iGsdd2cbRQjQh4Mzx7Kiw4PFkv0Mfy8fSgX4DH/DRLhGfUwNKif6JF5OzIjZ3I6ZE
 kGJ7RmYmVdm/flBjtcKWCxx8tBnANZlrk2vTmV6Oz8MqGY/F2hvvWDzusEZBlmh0gRhQwHbDYp7
 W3OHeheyPK/4X0W/OTLVRQX98XjvY+JGS7JksTNQ7s9AS/MioQqTpreB+hdOlnDTzFccVhGjs8/
 eSnAvxFUHhC/mJb08J53s86jMbR7VQJV+MMkKnWR/hL0OVOixINCJ4Jpsacc4qVzrnh1RW+XUEu
 JvS1uRN27aZlOvl8Z68ZEpyog1KvJB4qfJH60se+UayrpngQxEhvuu2MY4nHjRCEBHLS257s6tM
 1u6MaadNWLPpm7eRtcgm1bQDuC7LG9GVA8GqCXry6UtIcyYuEaFtqZk0+0X3iKRO4/nRVculuje
 d3DG5Z8Sv7iyxKsaBGzqUHi6Ibg9GLdjvsHLJ+t1fAaufiPCgMhtzrvKl/l+XJwysDjy1AUGhc8
 v4=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239

Replace jiffies_to_msecs & msecs_to_jiffies calls with sysctl specific
converters. Removes the need to handle overflow corner cases when moving
to and from the unsigned int and the unsigned long spaces.

Handle the unsigned long overflow in the sysctl specific converters
(sysctl_jiffies_to_msecs & sysctl_msecs_to_jiffies). The unsigned int
overflow is handled in the generic sysctl int converters (e.g.
proc_int_u2k_conv_uop).

Round up on writes and down on reads for both unsigned int and unsigned
long types.

This is the behavior being fixed:

SUL="/proc/sys/net/rxrpc/idle_conn_fast_expiry"
SSI="/proc/sys/debug/test_sysctl/int_ms_jiffies"

1. Before
    # HZ = 300, CONFIG_TEST_SYSCTL=y & CONFIG_AF_RXRPC=y
    echo 1 > $SSI; cat $SSI           # -> 4
    echo 4 > $SSI; cat $SSI           # -> 7
    echo 7 > $SSI; cat $SSI           # -> 10
    echo 10 > $SSI; cat $SSI          # -> 10

    echo 4 > $SUL; cat $SUL           # -> 3
    echo 3 > $SUL; cat $SUL           # echo: write error: Invalid argument

    # HZ = 100, CONFIG_TEST_SYSCTL=y & CONFIG_AF_RXRPC=y
    echo 2147483648 > $SUL; cat $SUL  # -> 4294967276
    echo 5000000000 > $SUL; cat $SUL  # -> 4294967276

2. Now
    # HZ = 300, CONFIG_TEST_SYSCTL=y & CONFIG_AF_RXRPC=y
    echo 1 > $SSI; cat $SSI           # -> 3
    echo 3 > $SSI; cat $SSI           # -> 3
    echo 4 > $SSI; cat $SSI           # -> 6
    echo 6 > $SSI; cat $SSI           # -> 6
    echo 7 > $SSI; cat $SSI           # -> 10
    echo 10 > $SSI; cat $SSI          # -> 10

    echo 4 > $SUL; cat $SUL           # -> 6
    echo 6 > $SUL; cat $SUL           # -> 6

    # HZ = 100, CONFIG_TEST_SYSCTL=y & CONFIG_AF_RXRPC=y
    echo 2147483648 > $SUL; cat $SUL  # -> 2147483650
    echo 5000000000 > $SUL; cat $SUL  # -> 5000000000

Fixes: afdf35cfae0d ("sysctl: Fix type truncation in sysctl_msec_to_jiffies")
Fixes: b96b5c6708ea ("sysctl: Replace do_proc_do{int,ulong,uint}vec with do_proc_vec")

Reported-by: Avi Weiss <thnkslprpt@gmail.com>
Link: https://lore.kernel.org/all/20261102111516.1398262-2-thnkslprpt@gmail.com
Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
Avi:

This is how it will be upstreamed. In case you have any opinions.

Best
---
 kernel/time/jiffies.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
index af1c69bf0c23dbcf1788e951dd9872167388bd1c..b861dc860d3452b59868128ec83340eab9e18a39 100644
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -137,11 +137,19 @@ static int sysctl_k2u_int_conv_userhz(bool *negp, ulong *u_ptr, const int *k_ptr
 	return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_clock_t);
 }
 
+/*
+ * Calc ms <-> jiffies conversions for sysctls in unsigned long arithmetic.
+ * Think hard about using the non-sysctl converters (msecs_to_jiffies &
+ * jiffies_to_msecs) as the interaction between ulong and uint is not trivial.
+ */
 static ulong sysctl_msecs_to_jiffies(const ulong val)
 {
-	if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET))
-		return MAX_JIFFY_OFFSET;
-	return msecs_to_jiffies(val);
+	ulong secs = val / MSEC_PER_SEC;
+
+	if (secs >= ULONG_MAX / HZ)
+		return ULONG_MAX;
+
+	return secs * HZ + DIV_ROUND_UP((val % MSEC_PER_SEC) * HZ, MSEC_PER_SEC);
 }
 
 static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, int *k_ptr)
@@ -151,7 +159,12 @@ static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, int *k_p
 
 static ulong sysctl_jiffies_to_msecs(const ulong val)
 {
-	return jiffies_to_msecs(val);
+	ulong secs = val / HZ;
+
+	if (secs >= ULONG_MAX / MSEC_PER_SEC)
+		return ULONG_MAX;
+
+	return secs * MSEC_PER_SEC + (val % HZ) * MSEC_PER_SEC / HZ;
 }
 
 static int sysctl_k2u_int_conv_ms(bool *negp, ulong *u_ptr, const int *k_ptr)

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261118-lklm-sysctl-jiffie-ms-conv-708b96e4590e

Best regards,
-- 
Joel Granados <joel.granados@kernel.org>


