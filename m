Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514056;
	b=iFjwC8vagnCcj6rrTcn1tgIAKoyVzQNDVv76x6sxsFn3AkFTvKnpXZSRBF8/LRI7F2n8
	 pQd5pl3SEa3gP7CFvKp0EuTXyChG7bbCIEZDEnFMfwiyGbDHkrf4sbE5CL4mu9M6muNUK
	 8PKqico/McCll7bSt9XalVxsOrbmptsIE4nk/CYdpf/U8hGdQWPk/GtfD0D3sN4gV7bY7
	 hzmBZVGHuqlFI9HSA7yBC1pQiYbzMDFgP5YsMCxGllhSh3390e+fXfmVy3hKhJP3gBE7p
	 E0iHG9WOnYX5CC6TBlWwQr9fd0fCiZ+0DQz08pD9fYchjbzcmUjOXeoePi2Xt5zQfqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
	b=rhhFj5xqmwqKMlcE1AMdHk7CGuYrOt3a1JRVa1V8FLBP9lAQDNdbHn/T9hvwHWi8lQ4L
	 sJPIWxXLglcfd3mg6Vj/AM7k32Zdg/eT9rQgImUi3sK5Lh9xB3/+2JQ6nnq4QJBmfJC20
	 W19tN547Ml5QBRH1yU+4E67nk1KdUW1Q7yxJqT4y78r5irq93o1ZNLNxybMzXRE/tbBAT
	 lDkTcb6Tz6AlKIr7rvXidw2uOkfavHS2wlP0rtCsSL/++iBmYpYvyBOjPAaIqFQ7npCjf
	 XztBgZ/2PITQJ18/LkTTcdwuXguRIi6kNNFPdyj1+qCdwkpihIGqupktdf+7Jy4ckng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW4MoJ7I;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA432606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA432606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW4MoJ7I
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so11422777eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514055; x=1796118855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
        b=BW4MoJ7IT25BW1Y3a07hNiL4hQRmru0iH8qvQIt5sPqqGxnINnl94hOPhVGxpWwY0D
         zjf4mKN+0d4LpetLtXL0qyasEO0mQXFET1WSXkToHAz1e85H0Ey5N3JOWDJ7VdO9HgVI
         SBD5I3R8zsdgXhtKfjC1F7rX+JS3U89AMbcsLenHIAQeGjnL9CPL9MT4yPzlY6QlDeYu
         NMpE6HgzKs0Qxdbaw/SJCmx8HvbSlqYHyv8fKSD2jJjK47GX/+0xe/EIIvJ7pu9PTmv2
         01x6PROW/MhpDeIXSmmggo+bw/GpAMl+VnuNkQpadNZ/wQDPUlX0uO0Tuoh9RXSp7O1g
         VbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514055; x=1796118855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
        b=Jb8lES8XPlSKyN+eDS5BqrY8IvnSySKvScBfNwBew6cxer35tACm1+PM/awaPFpsdl
         ajHUqZ6E78VlcItcWxrgMMk+KC3El2/c2RY1zRnRNnTXG9m6H8G2WptKdNP/xPu97Puq
         oDVixrKAtStKe5HL5WCysAEicT9edIJzQGStkA8nePmCg5OKSXywPsRLyFXD99JJqCW2
         FuTDVUTi/065pZIHTq/zkWzACe1d2T574zeV+67qsGOtuouPUHN7+oDgLc4P7rq6+L+Y
         pwQqf3dDXsdQkep2MCe/x7IFFNjfMTIOFgdNq+Qo+l++YAZZkK5cW17Zb9O7Ayword+Y
         zQRQ==
X-Forwarded-Encrypted: i=1; AL+hErEI9ZZJMDAD6S3ZrSfgJG6GqkRSqt2UZcUUgL0HUMv0tYjLSzgoxCMI5PYVfIfO7tM6MRuL1RWPzzotBGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LKBFijJuRNvC+134vS5768QuehtrPv/sbzWZv9siQ45EArpxG
	HSEc4OCALmZf5XurwDrwWk8CE+IS41jxovRP+0JbNvYGhFK5j5t4XFZ9
X-Gm-Gg: AZFdTZdsbeuFW7N7241AekuPGTp91K2kR66RlK2jxoS1gRQip2iij0lS0OaRR6A/tID
	2seL1QXvCFGlNhko7xuXM2j4SZdgByd5f/1K3v0Sp8/+6w5otzaUbMluVqBUjo2c71L9kqmmPtY
	dl55p7NmzNlrHtpOL5L3MD8GoQ1H+S5EyuU2XUQ6h4gqgUXbV7ktri0sVGgfKzIRK2doqwsRDqx
	sCYUJc4xuMMfPC37wjC7vCD/3Ss1Dh8mbSMhPxqIGAVyo6ELlXcu7Y4kMHNfMpTeJtOkqXKPkYy
	PM6ZM7TVw48k4Sm0VnL27rEMj87SUoXXzPIAsLmUUmH+bBzd2JSHKbQ63GZ2dP1ecaiDSpzzg3E
	hMES4c1Q0gaad1TqFBTTNiA2QxixVV8+Q7dL3bPpjR/V+8waInAtjwcznMoGKosAmsPbA6syAft
	Qi23BS3f6fPzF3ezBOl+sJBSk0Lw16HRfbdU1SFPwM5DA74yGvpTCvE2O+vug9hsX2M7bM7d4Is
	5C6X50Lo7DErv1ySj08gOdefjENWG2pC1ZwLCjqub5qeoyZ/HuOFIo7Oi9X1m3w6evpNpkEBozk
	OSKsx8XfNSMzOktys1piby63/GMX7q9o3wCm5ixMcBE58Au+JsrBCRIvqgXjdpsg+Fu5
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12421220eec.2.1795514054686;
        Tue, 24 Nov 2026 01:54:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32041395eec.1.2026.11.24.01.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:54:14 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Fenglin Wu <quic_fenglinw@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] leds: flash: qcom-flash: fix the v4l2 flash release loops
Date: Tue, 24 Nov 2026 16:54:07 +0700
Message-Id: <20261124095408.3842986-1-congnt264@gmail.com>
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

qcom_flash_v4l2_init() stores each LED's v4l2_flash in
v4l2_flash[leds_count], and probe increments leds_count after each LED.
So the valid entries are 0..leds_count - 1.

The release loops in the probe error path and in remove() start one past
the last stored entry and never reach index 0:

	while (v4l2_flash[leds_count] && leds_count)
		v4l2_flash_release(v4l2_flash[leds_count--]);

After a successful probe of N LEDs, remove() reads index N of an array
with N entries. When probe fails, that entry is NULL, so nothing is
released.

Release the entries from leds_count - 1 down to 0 instead.
v4l2_flash_release() ignores NULL.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 4e62a210cf98..1003ba060b42 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -953,8 +953,8 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 
 	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
 release:
-	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
-		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
+	while (flash_data->leds_count)
+		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
 	return rc;
 }
 
@@ -962,8 +962,8 @@ static void qcom_flash_led_remove(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data = platform_get_drvdata(pdev);
 
-	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
-		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
+	while (flash_data->leds_count)
+		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
 
 	mutex_destroy(&flash_data->lock);
 }
-- 
2.25.1

