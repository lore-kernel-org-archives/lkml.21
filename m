Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989802;
	b=J9iAVoogxqqV4j6lfkHG7vnxZtxw5Jm9/t6hdQvWIe3uzSaMqqGGZNrpW8CRKhLArf3j
	 KfEJRdYIP+Hg1cguVw54b2b5sftdRkX6eF1BFQjAhXQFEbt5HPswRu+VtQY32uEYvnVxT
	 dnQ20NxEEwynOrQb9dAnWupM9AM6gv1Xk1Mj9GfExjbHWmcOf8BlH1dYWbkcCzUlwQQJX
	 9l0LmhkryZYB6itKorw0oeCl4yBITJXvi9BrlvlVRmsNFPBBjqAxFckwrlMsP7XEdNDZ2
	 LJpcC+cyjOVycXUFIU0yZTaRhgdXKtT8ATl5Y6fK1dVYEOSR8XN36Ulc9hY3v3fmPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
	b=oTgii0BIgN+dLs2oTZDiaUVA2ncR+mJ0QbL0gIsXM08Nk7QV7TZydGd+FDu9iHlr33du
	 djnaQjUEfGLtEMsGIMFp7QRv55mMXdchQk5Z9CeWtUKOWXQT8xdYsoqZEFWIeiMsy20wN
	 wEKEThhL8TiAWV0hEAoJJtjU5rikuyfJ8tvXnn7PoEOxoETiiDm/DBHJDDd6RZzynzeIa
	 FmvPKsQZsaYdvZEkq4XH4HHNSVxCwbxKd10FxuAwxp0NByd3u0tRiKIxloFDLwGrMUudJ
	 bbFfFKss0oWxVHsttkqZgSvDlZdMtlxn8RSwQ6hs+aA/4a/8P/kHML/2oGjovQwcqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuTTVcl5;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5A606A89A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC5A606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuTTVcl5
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a594d313a3so451411b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989802; x=1795594602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
        b=XuTTVcl51SCkrqSB3VFLGkqPP3965b1iAvPl6o2sa8tSPkc42KXvV6W8sQlZX/NIq3
         CzykdKoBjjoqz4/RFprnQlWQCT5LZlPjYJzXerswiT4e1FNWiPiC6DKkUv+bam8iNfWB
         y7CFkwItBlac6pSOazyZX+zwNZ6+XjW6Xvc5dzW5Avn5VcHAUXeTw6CT40SEutNkuPak
         bi7Izm4jUcKjwRbPZFp8ZEcn6d3O/RjkwDqzgse1ACM2jlNstymy0fp24dwQB+BH48Xi
         KnJ6vCYYjeJH5UF+9nRiP8T+ODxIjk2Jx9uR+2RWPdDyWvDG/fBPPeryyUMa9og3a0Qb
         BQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989802; x=1795594602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
        b=kUCgZneHqA4w8qLMz4zzsGwiUg0Wwq3goTm8IjSGHwP40ifA4CNudqsPLf1icLHFQH
         h7zzlcwQWlcVXJ/GBucyu+myiSKXG0dfHWFKSeNFd9DLDwNYP4aZfaNz1+ak6tqYsIG6
         xdqoYWzsdMwAlr9N/h15JyX2XC9fqDnozEnknRMSkGFK8JeCkW+typVG9wj4/tg04RwR
         gqzuhZ7jQVOUfgggrOvbRryjEZwZrA7B1xwFvpaOZ8Gvj2S1Os/7W2nAgNAqnyn28q0k
         QnQL5InmOKpOFdvv5ESyEsTP6eVvneoqsk3G5rI0i7+QNSRBZX4nryzeNe00t/VcpCw0
         3ZUA==
X-Gm-Message-State: APuU4Z9L2YjYa+FMUrO0CSCPDlE4e/wNzt0vHvccYKoVCsr1S9ndH06s
	Ix36NuT4o3GxOjo7tsL2JXVh1T74pn6j0TM16I2nYhz0t1VxzFSFp/oE
X-Gm-Gg: AYBFou3E1TFe12POMEXCFS4ZUD5T6iO6X7nU6FId2tizusirEuaTOxc7CnJqOyrKhaC
	qJECPUwnnLi6qJx/piVCJDE1WRW1TiyUqgUukudVny3xHpUZ2oNM91JhpCAjHiWYtaHK7LHMAkT
	6/VMJakFk3/JrkFBZY6N3jlceqMSlG65SNGky2IEwETERQyM9yrLYoE6JEEAs52O1Zcc4Pjz4+S
	w435wm5AyI8SQw4ahR1yywIacFzc6kZTJ/a6nzRdQ8kyiVg3Dz8wkDArEetE0GIcmqDXqT64P6F
	hA/yhU8RSQD5RKf1xL1PRK2USti7fK1yyAAdTBbE1opBM22rwG15me67gmBsBcvrVxFr7UmrmiO
	NIbJ87GgolizazGbDRZK2R3/pXdtR+1w8VC9E5I5hP1VJHIqniWhHzGimlh8rgh1izwX9aHyRyb
	xtPJiRZ5AaL0thz5hKtLm24FyGj+VF3daLAI+CDreYFHF/tD7QiRZCOhCp4s75Tfx2tfvD0HLVa
	XwpZvk1hP8rHGLWaZphzAIbEtSiqijEsMQmMIyK1I4EsZrpHgxDLujo8cngWNR0DZA98ASsBWzU
	JYjCWLX6Pn6DwDMBPhEaIPrrwTtaiM+zzq7Ljs3I29Q+YLykmLWbuUPcO2sZv0DrmrRuGP3agyL
	3ERww8lq2TkvRM0Z3
X-Received: by 2002:a05:6a00:a93:b0:89f:454d:8e6a with SMTP id d2e1a72fcca58-8c5d334435amr1683683b3a.10.1794989801542;
        Wed, 18 Nov 2026 00:16:41 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:40 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 02/13] mfd: nct6694: Check the length of received USB packets
Date: Wed, 18 Nov 2026 16:16:13 +0800
Message-Id: <20261118081625.2399247-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

The response status and the interrupt status are parsed without
checking how many bytes were actually received. A short or zero-length
packet leaves stale data in the buffer, which is then taken as a valid
status and may repeatedly dispatch the same interrupts.

Reject short response packets and ignore short interrupt packets.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Check the length of the response and interrupt packets
  before parsing them.

 drivers/mfd/nct6694.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index b7088b2850f7..8d5a6f6a7143 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -117,6 +117,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -173,6 +179,12 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -207,6 +219,9 @@ static void usb_int_callback(struct urb *urb)
 		goto resubmit;
 	}
 
+	if (urb->actual_length < sizeof(*status_le))
+		goto resubmit;
+
 	int_status = le32_to_cpu(*status_le);
 
 	while (int_status) {
-- 
2.34.1

