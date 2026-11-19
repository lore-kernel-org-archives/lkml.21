Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066484;
	b=rJkP5GnNE2dZSaZadeBdARHtmvKLkUgXTIyqkVGX44cVEIH7geKH1EjlnzQxakE4GteD
	 8hNeEpfl8ZrLgIp558ahLvoxYLMOde5GNHIjT7LDfJ1LgcGTmqQqbuYU2FUucgBINz8mx
	 U8LJNWQBzLcrsVBJJNL8JLHD4JxgJ5fsnLIqYb3XEkvpqh9gt837aFCQtPcIQMVM56Agl
	 Ctz1jQV0NDZKyOGXixUFXvQKAVNjNuVA4H2pKxiqMHZFwGvLfhPZL/r4Wv0sxpit3Z8XI
	 S84LC7rs0RL7w3MiBEdpWANv6PDflg8Ife2iByZ40q/G6xx9Dy4Fzc0yd0Gaf+RmhLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
	b=kqqKeNNPEDXsIzdejKImsCNAj9IoFyQEcmEn+VgPJ1svKQ2xhjDj2ZS5ZtxynYRBOko2
	 k9cyXz+5pgAk7tLHy5nhnFbUy2chxvBC4Pz1vDwK3Xtyp9p8+gnqTNVr0a+ajhUlki5YF
	 JynAgvkxXEPkLEUciXwKKIyb3bILOfFuZSCKgiHM4hR8DNzEE7KH0YIAPwzY9QredcDHA
	 FjCRMEs3Y0dPfagDojWn1157MdtA8/dgOD3Tp8A/qgX0Xyg3jwdCqlIdneKPvXItzA82y
	 CbQxtsvTeWrq+E3+DxoaFLZDbO1A+oBMMIcbwSc4nIoS45hey1WTa+iqsUTUB45ykXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Idb9rU17;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB3606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Idb9rU17
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49a92144733so816524f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066483; x=1795671283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
        b=Idb9rU17frJ2gEg1N27gOZs8AUcjvXJX/XjIeUn12LCC/ZCyYVNQwOAYQTxDUSIGFk
         GSWOhAavX8/7Z1OKmn1UXKZ5C+O/PSo6tnSGzLHzKZG9rS8H/e+dj1bi2adLfhsgegfn
         o/x9tTjEJk88M8gH8mn5oY1LbhkJ0PB39YRDwdahpJsu2eLknTFXAMCmJ5tvA2qKsP1R
         KpPY+WKFMp/HYoDKSpy5MnrdENmF5kmVY6E8CJPY+YuAuklrqnJAURLST0yCpXcP8chI
         7/Zf6CkPTJhzKZKYaFzRfihGfhz5oD20B4NmO6IgOOBvwg27T/NsS7LTL7SyB29UkWds
         pmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066483; x=1795671283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqNOA/XhMTTZd7OvJELMXZv2ULVvy6ui2nsQvAMkW3Y=;
        b=x+YEsGJCPk1uAN5dojDNwhy7jq+PYirpuVusdJVIDA4DimthsyIo1W1z1ryAoA+jeK
         LL8HK3ih0luM6oj7eY3GVI+4JeIDl72BK4GXC6UtAtgvlo9jemxC8U3CYXgm6mqWm1sW
         B6g12v2hEY/5PRWci2Ur+1+3tmAjXWWEpA1u3oG5BtxInVEeKr0bTeRQvN38rMhdfbZd
         1uECvptgFXnPRudr/095lrS5o6GRYx/+bOCrO+fbNYy8bDfnIQZzpKhqSdSlSj5de11k
         N69apUPEMubtLKvEmrG5UUxN4Zi0IVo5z5Ca04PRqniQL7TrN6th2wDcmcRRQk9AtGWr
         Inpg==
X-Forwarded-Encrypted: i=1; AL+hErHmAJQo23zbkR3GoRyssZwIW6vR4AHMe8SsPx0sFt2lChP6F7VZ4jYEaHKoghMafz1jjLJcnYF6K7VG3NM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lP8DgoZm78MV3zc+azco8PwNkyiZ4Mf53derINWjWZ0rzXTki
	P/kFKAJEGB5itY1p8QfR8e9MP/HixEBLmZG2jufcF1EDmTUETcDv2GvS
X-Gm-Gg: AZFdTZcJcIF+gFpdkqsitAQg61tJNzCfbuRHi62bOoRpjJtwoBJ+Vh6piqAO0vhkxki
	do1CpirozybS0cmwuqX3AU7bBszn6Zb5KkMGCyOkmdkpEyI1g31t1UaisolMxmRL5G/dObYSFoQ
	CTBCe/+G+jH8RbV+Wdrt/AabG9XWxBnM/oB8p5c5DbYXgHSkahQqXJ16nex8WJl/QH92+yddaKf
	Sxwd5yyQCiSEiRngNXgdJmyJdVuHrcR4bF6awmfFXOyw2LOOxCB8ZydwD3CWna8tUAcCy1BqhGV
	XbHmRCcEL2qC/xZfAjLZnCN1FueNDcD2bDhFNQxD6MyEVL/KhHd+uEHzLmmxwDVe6NH1akjwtLH
	6Kh1plc3mASABFD4Kes2uArh4wunn5xZ3apSN678JdUqbFe+VopRBnFqbjj9YhjfSGeNkw2OVF4
	Nli2T4h43PROA4rLf0gm0tb1XgiNasdTu7aVQo8AKg/oIyGEVzLGpdt2xy3U7ogsNoZM4LDc3ZP
	gSZDDUEj/uwLlzCrjd8+a36oyjtLGryUMN7WnEM+9FQ53rFN4/BeMH+TEAoQbf+pIms93wQgy6r
	7rKpbKs1tOf+NmJ+VWh5+NFxzRLO2S0bLXKNXBo+SQ==
X-Received: by 2002:a05:6000:4b1e:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4a638bd6a63mr9511769f8f.18.1795066482521;
        Wed, 18 Nov 2026 21:34:42 -0800 (PST)
Received: from localhost.localdomain ([102.185.156.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm8674320f8f.36.2026.11.18.21.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:34:42 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev@vger.kernel.org
Cc: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org,
	Mohamed Dawod <mhm.dawod@gmail.com>
Subject: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Thu, 19 Nov 2026 07:33:57 +0200
Message-Id: <20261119053357.2033707-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
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

cbs_dequeue_soft() estimates when the transmission of a packet completes:

	q->last = now + div64_s64(len * NSEC_PER_SEC, port_rate);

len is an int and NSEC_PER_SEC is 1000000000L. On 32-bit architectures
long is 32 bits wide, so the product is computed in 32 bits and wraps
before it is widened for div64_s64(). For a 1242 byte frame the product
is 1242000000000 mod 2^32 = 754451456, which gives a transmission time
of about 60 ns at 100 Mbit/s instead of about 99 us.

As a result q->last stays almost equal to now and the packet sending
time is ignored again, which is the problem 'commit 961d0e5b3294
("net: cbs: Fix software cbs to consider packet sending time")'
set out to fix. The throughput becomes

	idleslope * port_rate / |sendslope|

instead of idleslope.

Measured on a BeagleBone Black (32-bit ARM, CPSW, 100 Mbit/s full
duplex) with software CBS (offload 0), one UDP flow with a 1200 byte
payload (1242 byte frames), sendslope = idleslope - 100000. The rate
was read from the qdisc byte counters:

	idleslope [kbit/s]   before [Mbit/s]   after [Mbit/s]
	10000                11.1              10
	20000                25.0              20
	30000                42.9              30

Cast len to s64 so the multiplication is done in 64 bits on all
architectures.

Fixes: 961d0e5b3294 ("net: cbs: Fix software cbs to consider packet sending time")
Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ cbs_dequeue_soft()
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index 1c93469c56e3..107c2b6e9da3 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -222,7 +222,7 @@ static struct sk_buff *cbs_dequeue_soft(struct Qdisc *sch)
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
 
 	return skb;
-- 
2.25.1

