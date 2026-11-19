Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048147;
	b=3jCAvZ056d78wfn4Rd8Nw/DwkxC7xFAo8kA1LGIT3jyYjoKP6+4ha7tAAzXWfCP+1kWk
	 /1HDNlRJBo06fDSa8ydlvv85sv85/j//n1FbffzM9FL6uAXN1a1K5g1X98iYY9kyKdplJ
	 jMgNW8LazYMGzKQ1JzD6IUZATo0dHf2eUNVEvm7tkSvASe61JdhWAYA3K0r2tlZMvd60w
	 JHzJIIfIxZuhPoc7sjCNTaFpvhGKXa7HixjZ26IRt4NA1akd5gfVFuJFD3Gr36+W41g1r
	 3HVsJDDfUBp9gBEKEL6rpC3yigoZXvD/sYGjae3a++AzwG/VBcRe90VuGDFHbmTmAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
	b=B6Babv7K/4V+g5glIw49m4nSjO/PqF/3ds+fkfuYHUIuCNejCRs3oBviWzvowDaebGYy
	 Z+E6GfPMvefnYjK/v0IDUj+oxS+7xrjNRFnQ8jOuK/JiDBUzA+QOpUc85HZgwnCLTka1/
	 mY/6/Mq2IpZtI5sxahrmcCPa8vYSoLy4jQdCLLeExWsEiRZA1O4ytS+ExBZXsLUTxDqjM
	 jqeqAa3DLB5mYz0ebMH13cBnLeG5BdPOka+mGjJDWIw/78zG2JQ1alCI9Ei5azvh89A5L
	 XM1Ew382KIhh1o1SjzUbQhnKvw6sSANKUjkDkQx1gqKNJHb1b8+S2tIHOpbnkX6FUtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FcSNu/61";
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B598606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B598606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcSNu/61
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso19333756d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048146; x=1795652946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=FcSNu/61jCMNPrOtKUwgp6kZv3gWcLIy2clz/mjA5E5lu3XlY8fYLpyAjxaVgv4tAF
         EwM83UUQK0Mj5NkhAkQmcUx8gqQOK+mx0kEn0A+Fh2PfIgqtd+LzwsXjJCMEjR6ZPue6
         jH3u39YDBP9EXUIx3H/D7MCEdFUKSGMEsNZ2NZ3ygkhJY4sQ6nppfpzSM4H0eavbd1qj
         kM0L4TvWleapXT6HWdWjafWXmx0wABbjqb/c4YMsGnaXqHbKNfVqpJou9hdzfY5gXsv1
         X8OXp4vTQX0ZY1T8zO2+UgGvKL/shaLYI7m+iYzAnUnLY+20yeXSNSbmkWfE3z/IBPfO
         vO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048146; x=1795652946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aJxpNGDocOFUdmsrM2zfm3uFoQrrqPBVAxJfScRpLA=;
        b=AfipNGUEgkcGsUDNLAWIYWDvKPNVJ2mhY5+IOc5ncqskgrRDDAE8XS5xfoPmgwXiEM
         sDaWQfXK+y/j0uS2pPaaNWoEFyQUpIYUHnGYSFpnjMfj2HiTCuE3WAMHP1cmO1eU5ZZD
         kQydS0OyLRoU9VrJOhB1MSH64pkNTTdVMwzJ2p3R3i8jFWKEmx1rFN0cDIHYxgK+5u03
         rtc3bmgG4A19XmHA8aVR51L6CeOrNmzfTQbwk9+7M5nvU7M+F2HjUchaUA6fTWp++HzM
         QI4RQcliTeQ7rNOYXZq6CC9hBq/MijGhFIEzR2TkCM10yPd8cWX/SIjnQDF+d6L9ET2p
         qDSg==
X-Forwarded-Encrypted: i=1; AL+hErEaYYcIKd5JdyMzLviQvUKhkQc2Y2NOsO7obxfOFanqhbEejnXGo+KIM/gfY7kIMUd8uoTZRteGd0QAWko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RgRyYLjN8UP3yK4l+r/icWsxvJ/q5FfeiwZ8oI9AsGxUhgu7Q
	RL6tSoxkx5mjn65U0GD8yuFBA3m66+dOkMJpKhQu/cPwJB4uZzCEXCQ2
X-Gm-Gg: AZFdTZdvqjrE35ssDw4ZZjMYyf+1YAGbgUwWoryt2lXbWDWEC4whN+1Z9kU7RZczBYe
	UfAUUAIPamT7rf4tdYbWsnjs/UNrqENxa8somEijaRj0oCI9EnQfc52voToUanjpPn70EvvaIMw
	01EqFRReoqqjzqYRUc/LBTdy7mYLjW8D+iyFWsxidB+wUGRB7uppKyrUB0/MbnTkRa63QpfSm9h
	dyOytei/tlBeE4zzMt/NjowSEscIaI7OaLGQBpJELj5rZogMH+aa5zM+u9WCnTT1TtPcsL4Kb0g
	yNJ5KENOs2ywnrILnPPic+TjvpTueWD9t7y3SyQNAUtiS7fVeT15icSJuXRG4XnNbyLAQTTBMrp
	tADu2fPt1oJmMRcWQyQyf3Mv0RXWHdtXN5oSWOOGRNgmAAC1uUixuyNjC4Ji6mC/hP9YGsGyesB
	e89xC05c9cJeERc9trKvJKapwe1uLp99u4SASRaIdLWCI1+uF59W4YjrlqjmHIjIdVKmDJ4vPnL
	z0vXkgLcGmoayfwjPbDGUou/lGYcCZUNVSvOIXizOoARKE/5UaHW1wINo+lKi6yjjAaXg/PpNGQ
	IgYGsjhC1AieCrlCNdDyrKUwmb8ucXcF4rI4hXx4vnRYaIIXYiOlqHOhfrUUv0Oa+cOc6e76R7I
	ulpeUYFBGvdkbMCrPIKQR
X-Received: by 2002:a05:6214:460e:b0:91c:8fa6:1789 with SMTP id 6a1803df08f44-92114f8e9b8mr64253386d6.28.1795048146119;
        Wed, 18 Nov 2026 16:29:06 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:05 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 1/2] wifi: ath10k: free msdu_id when HL TX fails
Date: Wed, 18 Nov 2026 19:28:57 -0500
Message-ID: <20261119002858.425666-2-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119002858.425666-1-lcy8047@gmail.com>
References: <20261119002858.425666-1-lcy8047@gmail.com>
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

Free the msdu_id if ath10k_htc_send_hl() fails. Repeated failures can
otherwise exhaust the IDs and block further data transmissions.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..298e6a092101 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,11 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res && ar->bus_param.hl_msdu_ids) {
+		spin_lock_bh(&htt->tx_lock);
+		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+		spin_unlock_bh(&htt->tx_lock);
+	}
 
 out:
 	return res;
-- 
2.43.0

