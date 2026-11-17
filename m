Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954011;
	b=p84cXrrkJJgXuqLuYTo4NHQZ13nIwZfuY6i3qPKKId9R+DSbS5faSGqbnn/Byncez0ST
	 /Q5+oCKj/LZdsj9nOnGKqRAV9btKLnnPUe3rhdkbOvJWwiXpsT/LWLHURU8HmA0Dno9LP
	 K8AO6of5AMrT0DHUEIP68GSj+IM3wUOjHtI2xWSfg8zTzE99CV3YSCu7Jl87uMtjS0a9h
	 fRt3Gl50xYqFYZK5K5P5UjJ7013diybLvZQM2wAZiMArg4I9xMeANZ/6iJ21+uvbeUyZb
	 WOH689otKotASdwrSTPBRBQfqrBVMfrraHN0+o22yy58A4bxH8Qut2XMSkqJWhG63qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WflaroK/HdnKLkiYlRX4FEHj2IhQFQVWvSt+QcA/ajo=;
	b=ayNenhIZ0OgKmVmq/kX9wLNpbqLcZr7fzmDcuWOoYUBR2drLFmq6Qza/O3j49/veAsiW
	 hYc7K5O57v8A/02dvxHv7hk2nI0URKoC2RFfyjIwOHORWzDIz7HEodN0uTT/eZPWBT4zV
	 GUVtT2fzx32CPY7mULMg7QU02S+Zf0aIHUaW5JMnTml7T8hj7VaVAHKvpGH+ysKCuLRSS
	 8ZfxgjGeI/zi7NKlInd0pIMSqwuVFPK8KnU47fHmdYYgH1KCZKmYpwU2vSvmDPVdYlR7I
	 LmLQd7u+QVg3t+3B2bR/FFnhfFaSigJfZMBND6ES/7UKmOv3zzYJadVXXPAiFbcENjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZNbf56h;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7840E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZNbf56h
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ac9e15640so221922eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954010; x=1795558810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WflaroK/HdnKLkiYlRX4FEHj2IhQFQVWvSt+QcA/ajo=;
        b=QZNbf56hHyO8lX5U1PPnYEQsUhlTqLGK4GEjkptna3rW9ChxyPm3Bll7oWHHu8hV1T
         RJx+KlhG5LQdb+p3UhBhHX1tiWVE6x9DHuPUP6PALV+Tno73c1cNOsYhJNZWJJlvtwbI
         TZR4q+tSGEBjZ2Pftga23cmxE7UKRlAF/SubjwecokI8fZ5fpH34bUUIk7qrLasS8NSw
         HzqL6RjVhiLljF2K7YqmOsE28+UJ/MUVlRqiWJef1p0DdXBk7S/Bhfu8+1qNmrZxKHKc
         4jp0tTv4C0kg/kT2aWdeqLxf1X6/TUyiMm/OTwQhd/NcB6jVu4ZWYroozX9A/lNjTPe1
         hYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954010; x=1795558810;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WflaroK/HdnKLkiYlRX4FEHj2IhQFQVWvSt+QcA/ajo=;
        b=riQznRxFmtYtB+nwYl8PKsFw+8cvOrdgdoenMuqYxzMoHKdiA6b+rDxG4vTotXFXkB
         KbXPIC8yG5+nX6w8Qc6s1b55l3wZMbsI4w2rE/ccYQ3Q9zY+fa9kX7xYeE7lXOOc55mK
         P1cMd3omMDW71Q2Q4ZF5Y8hqtw8YVq/92Q0AQROV63vCPWaJKQ2TaQS+1c9H1mZvhygs
         BlH2v4IplFF1JyPLdrRbUmrW1koggA2Apy1q9VnTrx4HeMt+FduhtSpdQUvrkKi4fs0j
         0SjDKyd6Op84dbTBG3sGEDafjY2wMfbqH+wy+LjjeyjVHFfnYE9KHxEEGhX1ZtUknYcT
         5WBg==
X-Gm-Message-State: APuU4Z9RCyMK9HJ0f9q7EFcPi+V6DIYSvsw5QoDuaEkknY6VmEzdxx3A
	JcPcmc6On5OBDsndeidnQG8oQ2VyDJlsfOIVfBc7/ZeOYKLaWKXQDKRF
X-Gm-Gg: AYBFou2JWUH2QgZmgcGZKj25tvimHd7I6PcvZEktwhiy+Ahh3HmFqr4FjqgC0VA+hQS
	6oxbKISRlvcojRx2lThsrd6LluigDa7EwhTSr84VHTQTSYIfIA5g73sPaKLiZLycDff0QzWT8Vx
	uXxb6+tbYGJAz6xgYdaay5ik8UD0urCFjG7wmM3BaOG2K4khxn7aca7V+kn6WpULWyPrMHWE1lj
	N1pBTB2PNiXyDa3NU+dIJu1I+WCfgbX5qeKAxrLBxwluYTqxF+pAjLvh/inCOgwbgbv3/D/9c09
	gtKzdaeytAh33kOHBCXJoibhQSMO0dQnhfy271gUaLU+MOjR85zK1l0JqxMx3zVET2bOOmvP4pp
	u767b6yl/Ny5qy7hClL2eJOTuYtcPYXjcbxEgafilM5XqNEt+EeTUH5kWSk/uj1cxvPvD8xY5gT
	9h72zjMPRDba2/SB1HNeTsnOt7Dj2+bJ5771cwSQoxVSJcPmbwbj8d1uKSetxqNsn/2Xjhk9/k4
	x3hcgsPoZLKQu2MX3y0cOqQEhpZ8cV+nHM/dGVgg+8XqP4fDGU7nvxzhKAq9v/Ssg9JHDVoMp49
	HxXYkBzJWzDWnO70cRtWp467b1rM4Q0ohaAZFRbXXe5KvW7ecxvmGSNi5JxxX165wpTm/4dOC9W
	+HyeKQ9AnWgVb68mSqk26+gNGVPDSrvuvWp8FfKBVT+dQTln7n43q1C6icFINCJB8Sy8dNMrE0I
	Ym7HoRndDfn0sjaT20jC86Wsvlee8CCdD6VQ6NRrvyVWoRkjEGiwOJ
X-Received: by 2002:a05:6820:5051:b0:71a:de26:e969 with SMTP id 006d021491bc7-71b1863c5f5mr559712eaf.48.1794954010315;
        Tue, 17 Nov 2026 14:20:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021aae9sm577548a34.18.2026.11.17.14.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:20:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:19:45 -0700
Subject: [PATCH] nvmem: layouts: onie-tlv: check both field header and
 value bounds
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
Message-Id: <20261117-submit-nvmem-onie-tlv-bounds-v1-v1-1-2b114f1153cd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O0Q6CMAxFf4Xs2TKHBpVfMT44LFCFDduNkBj/3
 QE+nvTmnH6UIBOKqrKPYpxIyLsEZpepuru7FoEeiVWxL0pjzAkk2oECuGnAAbwjhNBPYH10D4H
 JwNng/nA8XmzdlCpZRsaG5rVwvW2cFE+sw6L9LxjfMaXDNlP2LknLiFXWhTBKpXVLIX8hO+xzz
 60eo9VSD7onF2e9HZaNFiZHev0uT5w1nmHr377fH65AChnuAAAA
X-Change-ID: 20261117-submit-nvmem-onie-tlv-bounds-v1-81e03449bcf6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The table CRC does not validate individual field lengths. The field
iterator can read a two-byte header when only one byte remains. Its
value length check also counts the header as available space and can
publish a cell extending beyond the table.

Check the remaining space before reading the header and exclude the
header from the space available for the value. Stop at the first
truncated field, keeping any complete cells already registered.

Fixes: d3c0d12f6474 ("nvmem: layouts: onie-tlv: Add new layout driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-219531@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/layouts/onie-tlv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
index 4da3a704388e..1e397565b928 100644
--- a/drivers/nvmem/layouts/onie-tlv.c
+++ b/drivers/nvmem/layouts/onie-tlv.c
@@ -110,8 +110,15 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 		return -ENOENT;
 
 	while (offset < data_len) {
+		size_t remaining = data_len - offset;
+
+		if (remaining < sizeof(tlv)) {
+			dev_err(dev, "Truncated field header at 0x%x\n", hdr_len + offset);
+			break;
+		}
+
 		memcpy(&tlv, data + offset, sizeof(tlv));
-		if (offset + tlv.len >= data_len) {
+		if (tlv.len > remaining - sizeof(tlv)) {
 			dev_err(dev, "Out of bounds field (0x%x bytes at 0x%x)\n",
 				tlv.len, hdr_len + offset);
 			break;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-fixes
change-id: 20261117-submit-nvmem-onie-tlv-bounds-v1-81e03449bcf6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

