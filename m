Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735322;
	b=eat8o84CeSjWFk/fhDcozIc+IhRhvJ3s8zQl2RikUYF9IupdLNiPYiGWktlxm100S1vO
	 MqdS2HYCGdZIw9icE2fJFWgG7DQz9g++xexXz7lvBEptdg8RTK8DG+aLAuiRLe+6gqObi
	 5Ii+mRx2K58CTJ0vzDrdnGoMEel06fEJ+tS7Fa/HM03XuY0KDlq7C9t6Ds/WPm1La1Beg
	 FhvYlgPft9UlxqSfBkZKhZHo/6UEMsoq3m1PwvbyPp2x5jIj0ga3xfreE3yQn94bvAEQt
	 3xNNffwIyW6Bw95WkRbblMuTlf18Ao465v+6Q0rA8JnlkfK0SbFfLJeh40A05MvgcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
	b=fjwbRgKJzwYr+WK30RmXyb7z4jQKoEu+hnQbiyedZtslYU5k6bbLh4NN1vRPL/rGf7fR
	 tQ3quF+hXAiHn9wnynpc0sMLLaW5/PTbqcK2MNTJhlG03d28PQlTJ8JcXmu7YvxfiMx6x
	 HCA6BFpS8OrMaulNNP4VpydrJCbkRs2yRTK3ghrqJpw/NashfOxKEgttdcfiteoO3UFLj
	 6rNste1woiz7DzbSfzzNr/PPYV79s6dHqpMZLHL6KDdGM7yArniR9sDXS72/bXRkfUmKI
	 PQQfKBPwvBWPD1IQmG7BLmGt2viXJp91lebfj3G28c2K2YPDVZ6tyIfyfYskiAXAdwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICdX8mJ5;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17120606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17120606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICdX8mJ5
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f02f04a426so60147855ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735321; x=1796340121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
        b=ICdX8mJ5EIroNM+KUCs0BXqL1uwJmB7DSvo7xXRp6JHDj4bWI0YwLtq5J5lHKiT4iy
         2/Yo+uSFFpQLNSO9+Hj7LAXmT13astJ2no7xJaOarkrVOOc9RjuHPHIkDaBpcF2cSAlU
         06esrNorhwk1TzLZhqbmMCSvLn3hENp8y4u3nzEGOs8JGhpKps4Y6AYgX0FcjJMeKn92
         rNko1l4WlgkWwgwS7r0LXfExUHbVZjG6AjqJxWAhHZ4jontlB6fLgKvU4K9c7Uw7gRTo
         65YjrZkVyZ07BLPbzHxQ3MQccCiV9n2VmWW45znJuiXNj3SSQ7gO+ybf0F0jN0fAwRUC
         RihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735321; x=1796340121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
        b=rvPEEPXlki/JLRBcPHH6UYgkL1sLsB3CN2VwIkJS8Jw7+cOSVUIrMp3E0fqp8Knhev
         GMut8l7nsBmi+IF8/ek55ye2MGP6RrOiLZq3ZTfIKqCTnfu6G0dEk8Jpvvo5FYpmjOYk
         laqHpOt1L2NE7g11/vf5LwCywbr+b/sDXebxjD7oaGquqllm+1TtS/Qv70SOmiSCDg9/
         +zr/sNwAaXZxBumvBOu384LHnQjy9Ehrqea7EyjLKn+ljK1S+5tMbB41CLHE59Rz6Z5q
         pKTZqb0y+n163LB2Hci3wlOtYZmIWWaiDznpVdXJdfCOBL8kD9fgXziwWAglnXYZ3elQ
         9xeg==
X-Forwarded-Encrypted: i=1; AL+hErHyCiWuHJDen/WHxiOM0pADN5gx3ai6Y/8RJldTx2NXScRrhKRQTcuYT+1Np8rV8jEmjVy/o0+1aYHSRLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PcmqA10Gk+ybw4cf+R0HxYDLaliQ0ghNaMxasZ40kW6XJqn0V
	LjjOca02ObueG6+1ik2HgRLb/4z4fDwgxcy5DEm930EmyHOLah5ByLxP
X-Gm-Gg: AZFdTZc1Zllj1IqsmZVvEcC6bRnOK6D0thigzvvIBDwkXzkkNQCRhfx91euQDT+p6mR
	nlSLsN7Uf0caN/jvoWjvdq9cMWRDJSlxxPPeIzq51Ku+mvdq+xyvocQb7D0TLBCQNzjx0fb5IQu
	K++ZOkVzVM66UUnS5HhRrwK0e7b9x7dj0bPU6OSQAGngGoo6GSOwWDPlNcPOVXNoLmTWMi6pLDB
	Ql8MQa4iX6279sr0vuhHg+1epE+3BUA0cHGbXGpimojX0qzrmgIKLUOKpwF/E8YqsWh5Efk4msB
	jENv005GMd4VZ11kDYt/ly4K8S7Kd0h9hE9QzTZV8YCYCTxWeLuJPtymMT34HH4aeLmw7QMdS2c
	sVrq3g5m3V0fpoC+Jvh89sKUvZWoJ9nYSYnoHsxKaR8n2JWLTT9uqOX48pr9gjkr4gMG2g3DPnh
	WpiC+XyCiM8+1A1KUJ8iIrWwV7V2R5Ie0aG4mhQe6yaFp+Uje9N4tZWbbcKyoiIh8kFnbDR7Mvb
	uJcBYdA4b7QnGg8SHaxbBwhpeESsZabSqjotqWbCvy9gPGhoy33xDEablI/ONH4slun6CGprN71
	mWPT0JB8Pi05rFyQ+N77oRu14ymG1MUMNziJ2j4eam7jeIf1ZA==
X-Received: by 2002:a17:902:d4c2:b0:2f0:8799:415f with SMTP id d9443c01a7336-2f087995606mr168498785ad.44.1795735321417;
        Thu, 26 Nov 2026 15:22:01 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42a6sm110365955ad.23.2026.11.26.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:22:01 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:21:59 -0600
Message-ID: <20261126232159.68334-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Remove the trailing whitespace from the else statement in
cypress_dtr_rts().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/usb/serial/cypress_m8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 78fb1389b34c..36bf84df253e 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -631,7 +631,7 @@ static void cypress_dtr_rts(struct usb_serial_port *port, int on)
 	spin_lock_irq(&priv->lock);
 	if (on == 0)
 		priv->line_control = 0;
-	else 
+	else
 		priv->line_control = CONTROL_DTR | CONTROL_RTS;
 	priv->cmd_ctrl = 1;
 	spin_unlock_irq(&priv->lock);
-- 
2.56.1

