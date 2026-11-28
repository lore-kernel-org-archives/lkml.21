Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874419;
	b=uuBYtAjbPbQ3eKzJY8qE83q/NUPGQ2WZMvOfoblP1V33ppdctdE/cvMX+D9/JhL6N7DR
	 5JZd6KksSLf/BhBxreGPtQKC6nA+kjUIFhml9hnYOS2Xm8nfDXIUrpa3EeszMJhxHFj3o
	 /EsI0HW1nETuvJiBMXak9J24YeKPlBvnBrIPcqrPqDrZvReMTRSulA7ULTWo7y5xCXgST
	 ZhDqcLcJqDkbpmY0IEWN5Nl9y+Cxz3JzZRXQeZIBCT9lJTZ+yVeM7vWfLo8kg88FwtdYd
	 OE2UdaONchbr7rgnh7uKQSewscGKlGWVJUurYSGTFLo6sjkbppuL2iNSV7PhTb/ePOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874419;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=NAMrV92QAa0htwOQTUl0DW2cKPTE7G4L9fdKc8MfP1w=;
	b=vRKSScRLSajkJdrT3XHLsKgDdFSczd3P2EsY09DfWVJl4I4L77W94pSkXb9LSYA0smxd
	 6z+qsjr+yaXufWMgWnBOEydVQlj178LtGF5/lYl2fio/mcTgaF4jy/RgJmGue1ls4B5EU
	 E47gVA04U5+7qP2QduZV9BK49E0qZsareH9NLM9QkEruU/aY8XFt2jPLC6QoOgFYVA5e+
	 aFblId0higstYk6RCTtDPpwRxZ37y5mPDgu3MBisSGHf/9krKMmJG+TAny3eIl94pWOqs
	 RCukZ1Wx2q+u2bB/mPciSw4RczbQ6rWg0pTEzS6LEpGsdP00ecLkN2RvA7U4qrjO3aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=LlY+o2v4;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA1606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBA1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=LlY+o2v4
DKIM2-Signature:  i=1; m=1; t=1795874416;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:g5BN5FFWbL3WHfiahJwyQ1FFm9S6
   osoqHDTZhMVzaTdguIhVWmrLeUZi0ehKFPErYImbN/J1+hzUn5A1/25NAung98efuDmhbRiQPwt
   7r+tv/H5dAUR2Tpun1TA28z/caJ//jJNvv+2BhHQbXLhQ2xOVLBVMyJuwjbznDGO911xk4sHX85
   MnNklm9Yjr6xi3gFc0w/EItHf6CW19o2sulnEWS5pxcNpvy5+hBARvH6z6Sebl2hRGQ9cdZnvgY
   +5srs7VNvlaAheeSSjrIqrBNuqkb+VMGsATVkgEQsdYFY8yaDsJc2DcQ/tUrbThP69ppe9iIfRN
   7u/AhAx8s0T2YA==;
Message-Instance:  m=1;
 h=sha256:
   1YBofnwG8YK7y5JH/eGHPi3VnZPyKww97dcYXdsSTBI=:
   AJjrcuLeAjNbG1qC4pE54+CYHPMnFdksxvTxBMxPf1E=,
  sha512:
   Vu5qNSmf1bVV+LCEjKkvvkmpXhoQbOrSueauwcuJxBjSN+5ZEzh+c41UBS6mgxy/6leEuVu+3/G4T1+p51bXLQ==:
   N+2hWfDU8HHzJyV0jAQEkPOjROSfIVwd6uvBa/OTKMLrz3+VpGCt+xl7UlKa9BqOrrd3zvbpYxef7j7iXCd+zA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874416; x=1796479216; i=w_armin@gmx.de;
	bh=NAMrV92QAa0htwOQTUl0DW2cKPTE7G4L9fdKc8MfP1w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LlY+o2v4Fj4l1iXhtFxuLQwlqwPx+ZQByYdnIwBw7uuYWaGUfv/IdtC+MwoIhgfC
	 63FQ8GuIzIxjTCD3OyqGuw0DK3Mgn7XXWjJwyHREQ8TKXhgUWY9+EfjiKP6EQb1IQ
	 ZqG4QbAu+XrajNOmIJwh9wy4bpZ2Zba1aAwlz/B5YX17y2yLo6mZ9NYCf1LPFTeiz
	 fOgwVy9+wOaMRZthvfbD7XTATP1Msbi36lFf0XZomye7f1PEYFQUs+2ViCMuq9161
	 zyyuI8e3xsdvimYLHyE2wgTM0Wgvt6+nlGG/p8VBqzclsWMfh4uc27031aGNKDieo
	 jv9oObleSEgqEvXwaQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1y2avO0sVS-00NZ2e; Sat, 28
 Nov 2026 15:00:16 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 07/10] leds: class: Use correct type for brightness_hw_changed field
Date: Sat, 28 Nov 2026 14:58:44 +0100
Message-ID: <20261128135954.186682-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128135954.186682-1-W_Armin@gmx.de>
References: <20261128135954.186682-1-W_Armin@gmx.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TfC6HbzyysDunNz7y92JFS/nYPgALjZm8d/6uGmaWM3j8QL/eLv
 3TxPxwBDs+jfmSuSw9LQG6EMmKcKhi0Px/FhRwf11O79j97v1z37adETvqKzkWiQfhzJ45I
 ik5hefb4GBk6oe+mYcV09ESzsuYZ+AaNZRErY9FqR7z0paBa0MWJhAhMYlinqyK6Y+z6+75
 Cf3hEo36EOl3I/gGin0EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z/vzytsBf0Y=;s4NW3crV5PSwEzEtWeeOSpB1Bh5
 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

Device drivers can supply a unsigned integer using
led_classdev_notify_brightness_hw_changed(), but the associated
field can only store signed integers, leading to issues for very
large brightness values.

Fix this by using the correct type for the brightness_hw_changed
field.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 include/linux/leds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index beaf23993063..a2b5373460e2 100644
=2D-- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -236,7 +236,7 @@ struct led_classdev {
 #endif
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	int			 brightness_hw_changed;
+	unsigned int		brightness_hw_changed;
 	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
=20
=2D-=20
2.56.1

