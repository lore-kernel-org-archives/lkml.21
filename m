Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186852;
	b=F49M4bUZFd3QPVmvLDwMDRdDn0LeHKdkwZmuH5YUQi4xBzJkgas8LrCZh7erqC3W7wVw
	 xlL3SBcWNM8pcN6sfSBO99KOjX7axMB+hU76e92YBCoaaj6rcANspaKULk9/sxBcfeynL
	 ncZyg+r4QT1w4V6KJPBYHKyF8RqiljehgUMoJSnffY6CVpeoIE4igckJmdI/gzbUQQ48L
	 hCbjSrYp4k5oBSbMfUPQ+g6IeTkzis6FG6pqUz+F8rNzF2cfDKx16sBWZAPngVUUOuttK
	 KLKquJmFuGQfBdNKfB2FCn35Ec0oZ+OXlH/VM3nkDEa4DoNrtnLUObCl/T9glMUUZbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aEIDLWIG06GGygaJWYMA11748d4IQUnj+aASfTl/5Fg=;
	b=lFi9DJYTCAaTfSNOs8nO/rEEEZ3UoCfH+2Fl67NbIHebO6/3fUX32pQjU2qzIc5lshBo
	 8swiFItR3jn0cFiiFbjqEo5sOudvHfexWzyDe/DbYKAlmZnz+zT7O10GiHhzgD/v1cuHq
	 nQUE5JoG6Kfj8RN9jpAN5yFG5lVcd9gN25WPt9OCrfCe9jVyYP4FCalzeiTOxMJnv8sKp
	 zafMNZBq06ZFgEAW07PfRUhysGfT31w/7OFKarMClcdloCSonquVrMzAu+Sg5XqE/TgF5
	 PMoyrr4KYh2iyOP9SDAH5aYnKzrTKPnWUa0FQcVHhopVw5yi0LwY3/OKV4DcoU0rsSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QUDunFs0;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03060A6F52
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC03060A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QUDunFs0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso404818a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186851; x=1795791651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aEIDLWIG06GGygaJWYMA11748d4IQUnj+aASfTl/5Fg=;
        b=QUDunFs0KamSWnwyJFH5knzO3n1xxKSxhvkC2qRlQ0ARVdXMuJazwD8Add1l9UUaO8
         RHWqFwuI6AQWiW5iEgwh39f0JzFjVJ5gDSfcshwX1t51hK5+00kOLQ+R+xkFczBpHnqJ
         JqfnQv2bvUdI66PdyHVxIbCeiHqEJbHzA6lL3lHDPlSWMjO9AlBXu3oKE/VIX/Biq348
         u9E/IcG02CEC9VkseJtHYTAOizk6X1F9NC+vfiAxgdRoYhgJVBiYad7SBQojGhAF/Dmm
         T7Ql8Ypmz/L/bPraYOB9jEahLtC7JjrfOEiSXwDDqMvQAAWhrSE+huf84up3ajAxDcHb
         o44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186851; x=1795791651;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEIDLWIG06GGygaJWYMA11748d4IQUnj+aASfTl/5Fg=;
        b=XRuexZiceRpP9FMKUrNQdHXkf2UqQEomnDxhGrWZzqXSosjOit5JIDHJeeFbfGIQYR
         5W2FL0bek8NPsYOuwBR/fhrA2vyvFJenGIAoVFUAat89kF3qjEvoDK4yOQ3caf3qxPeK
         U6368QsLMydlXeVsug0RZoRxQR2ylcwKJuGUJdtQuxnTEoteow7csAvnOGNujoNiqc6R
         teiyMrDJDugWN/+nk6cUereaz+3JDd/+nvyzcdS7/QIJwDYiklh96gj20EWis+ydP5dp
         Llp3fWXpb+pk1GE69sGnNtJWZWLxBNpSsiE8zsF4PtnXSrXTy4Y+wDQSr+zFvWZ7MVzp
         rXKw==
X-Forwarded-Encrypted: i=1; AL+hErEX9Zw+vcqIhdp52TAl0SfVvbIXPO9MBP21LNm2oRjbRdSsUIrlqZo+aWJ6970K+vUX8Xbc5Q0XrgQ8nL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FoReCTzgSqQBJBfGVLm0J9fNjRAQgGEBMSp5fVumTVSUZmyZx
	OHy1SVVHEEiIvvbuDyFQIev6OydmTlaVBRcgYtTFD8JyPnY9NuMVHkV0PP7MVS1p5t4=
X-Gm-Gg: AYBFou1GOuwRQwPDSpYw89cRshaAdGZv+M1VH6xZ8z21o4/O0gogAfG2etHbfEjUw8z
	kWnIY0e6TwZ0Y5IVBwF95dLqv/eqLKAebqK8XWOtFJBqRi9GAZIPJwISs5jBKBa1DVcH+YIj02Z
	OTYTuMRa/prtaWtljcnZx+FnM4gFkNr1zSZ55pduLB7IJHs/2QNRm9Bg7zurbzWH10beM8uljqg
	imAlR5R3/vmQ64DZvlR+5tkwKC0X+62VzWu3SQRxKu6aBD7uFzk/9xPNNc7f9q3TOgdl7QpZKIt
	G7FiHPOCBGhxGnKSx26qXglcmAVIEeB6wH3v9JzFBiocgT/Uz1oJup1fbL/6zcPNi0IxO8p4amq
	Y5x9Akoso5gKzzGn4cEfq2NspoSkPIjKk41uhypM5AIdAXlCb5bTXZI2WlhLAPW1XtHZskwf/jE
	tthEOYekUNGBk/CiQSA0/NNgLzSgJ/MOKwMERLJApABUycctyYhq4SVEqq0SsySfcuxbIKEN31U
	oFQ/mWKke3aRVmO+SxBGVmCAmgkhf2GScHTrMuAn0zqwKvjjD2PbAVHgUPSMwpQYbsxvekhnvBx
	4tnN9K/fgZ5AxHqzIf8uzJVAF0I6+M5dNLPYi743zKjJoBvrnE6uKLVZQmoXPUarW6bRAWyIpDc
	iXG6h/LlAP8xow61/xp5Ld/fPtEQLBsj7ho6h
X-Received: by 2002:a05:6a21:48f:b0:3f9:3f64:9b99 with SMTP id adf61e73a8af0-4014d7630camr3111850637.58.1795186851128;
        Fri, 20 Nov 2026 07:00:51 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm1640477b3a.15.2026.11.20.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:50 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scsi: aic94xx: validate the indices the sequencer supplies
Date: Sat, 21 Nov 2026 00:00:46 +0900
Message-ID: <20261120150046.3128242-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
References: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 05:19:29PM +0900, Yehyeong Lee wrote:
> This supersedes

This is superseded by v3:
  https://lore.kernel.org/all/20261015091747.4184349-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
