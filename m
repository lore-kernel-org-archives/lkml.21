Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.0
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728620;
	b=MI/DOcEkVOVPeiD5DQ1TEIQF+gc8oRIgEb75h8nenmzMJk2BeWkiO3BzSBJQ0iTx0kj1
	 L4i99ccOYXG8Dy+d6Mm2lvZvdal/+Md/4uJcds4D83Vf1MbbUBIpzF3Nn64fFUBOxiuhL
	 zMULSK5prKhx+Ytj3NTcipLSZg1UZLfzggrY7F4X1CvGWr+GD/pKdSvPTDxx2DqkEqbkC
	 GMpJTYFhlymMqIPQ/anHQ278CVFAyLyzbfTXvC/jmUyNvC+6QHa1QJxkp0x/96IzspQKE
	 9e5RdGkdW4yw9LWEWjPCXn7nXyZjeaqod88XqpGbf26/2ASXF9lGX7ZHUhsVkkTafSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
	b=2HEjm5lyWTW4cCqqGxblIzHnU1slB5kpgOgl7Lu9AT+ESA3/tf8succsHwsWAdn/p1Zf
	 3Vsji0KEAuvzQHjQ6Ralv5u8xx4z/zadI2rVGhewGGkdmK5YFCMb7yS5O7j9ugrOniCar
	 99U8o9f8IOsieN5Sjg/yV//R1rLBRgABCHSH3tuBZKdPpkeAsaKn5VvmmsJ2sRzXaPwub
	 BDwTpo5S9NUH6H4GKMxleCCJcUvtj8v/a0k31gfbv+OaHNjpQYlqiU+7JvHQS0y+e9KKT
	 kTHiQV3wWitqRpxqlCICXFQUpRTSllsoW7VUkx/K+qQsau+sgFTyZHESepJTB8HvQHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH;
	arc=none smtp.remote-ip=74.125.229.0
Received: from mail-dy2-f0.google.com (mail-dy2-f0.google.com [74.125.229.0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA65606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH
Received: by mail-dy2-f0.google.com with SMTP id 5a478bee46e88-3117f9b9e64so743244eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=rBisZxHHB05JDLE+7PoXSxuYALG/9iHUO6C/p/+sPT5zq+ULF64KAiBafYa02atIIi
         braoxd2zOkGmFUcUOMsC99KRLXL76FjTtOpgYmi3aMsps6WqaFVB7UKPaX/qGPTgjdFI
         BnQ0corxtMGU7WHBw5JBaB3K0wI+VN5XP4OGuG8ig4njmETAHoALabORMoXKW6SuNqIQ
         5u1jtNLvh2Pl3nnKNcvZ2zS+BysbFDy40KUbvN5Lx3JLbQcnTyVd3cAS/F3FVkl72ZEq
         kGuNYG9qY109JfKZWB9pCVBTgFjOc3W/m9WZJbyEuxikMueSZZxZHqawBOTe6HoZH3tv
         zOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=HyqtYVMfQs4GAkVB26qbvTAxMDI3L5fqPjuxbmli7UwbRNIwP/aL13tyFA3a0Yz8rK
         6LjZNB9I0Ju8ToKmPmLiq4gPhZRWeZIMWtNyyCvtY+xJPQZFs5bL4SmWgmHeBcJyqcn9
         vHwmz9R9Kpbzo2/0FmZMhE8YVykbzLuLz1PtBquOAqnzykVoge8518e3eCNbXECPOpER
         dXYNqQSicB9waJL10yMBtAo6Jw79puIDsZz1G8XtV9BDnn4bHgWEH3OKbuEoYUGRpoG4
         NEfq8+ZvwJMcQBlvrVWDPYz40Z9ZstIIU9fMCh/8YFi7sAREczHDJ/RMcqIsZxuuh3Cc
         ncgA==
X-Forwarded-Encrypted: i=1; AL+hErGpF2G1C6Utt+tvXzdBZp9UlRvMJeK2dRNc0QhH2zUf4W9g3+8FRYhY+fH45TSxhje6DKqeVEKiHRpZEZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L+nqkzJyJBpk7e+L3qR23cv0EVgzCCQcLF39sVG/gvfpLJlPS
	XWq/1UAbSDkxS24qUVHaZvFhBAnSXdvVSgXw9MSk+Cazsb3cj9W5S3g2
X-Gm-Gg: AZFdTZdAGdYTsfx+vSfUA4wC1eSK/eq1Sll3fqijxJw+b+wBIib8F0GqDj+fUCXMkON
	a54MV3kN4rdpIP1qb38gPnIFwzqu5QgkypPADQM7FmVqGGZKXSyCx+TCMiu83GlAunjZXnkYH1M
	X1iMvbXihhHuupq2EeqMQGUJ41C/V2Wo/tL9SuwKim8wP0ZGAAEwutHiTqes7IWKNhlO9ODytHK
	GHNcTqWyNyv9QU09fhS0D5VRx+H99XYe0+NqD8l3+YvfKpe4OfdT/wUeToi7ZPQ9I7YQOVeomH2
	9ys+R4bQHrX3MYd3jbvq7EfNNkWJAO7+zjk5KXbADeWlyaHuJvWFdU5AnWT5iDenUHM/k4d+Dsw
	SLoOjbPA5XFtFjuIcsUmmgUICCNOTOGaXZ7NCJw+LQo1d3l+RpLsAbSmUrBmqRhpmCkvRWruAo+
	u7th/7MW5w4IuuoTLlO+MWOzvpDYCJ2biDCRpuL1OXCE1319cBRi0k7vmYtCvoaHuXSPD/QAwRy
	S7Im+UKF2hvRnT21ZBlM4pO6YzfQAYXZ30GndCG+r8MM1z4WUJK70gKH/xNxb2x+YAww1DAlc5Z
	GFiE6M6KTXGVen7DZu6VuRo+S30clJZppj/kpkwn6iJWSCGWu5zD0HbOh18mS6h8dwTLrj4soZF
	kQSfwg3Fk/npekZiyq6I/uoEuubB55YvmGmTBr4ZE
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr22309381eec.11.1795728617417;
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 0/3] media: iris: add missing packet size checks
Date: Thu, 26 Nov 2026 21:29:01 +0000
Message-ID: <20261126212904.27207-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 rejects a packet size that is smaller than the size field itself.
Patch 2 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 3 uses that size to
bound the walk over the properties of a sequence change event.

Changes in v2:
- Add patch 1. A packet size of 1 to 3 was accepted, so the check in
  patch 2 could compare bytes that were not copied (Konrad)
- Link to v1: https://lore.kernel.org/r/20261117204946.21359-1-dennylin0707@gmail.com

Hungyu Lin (3):
  media: iris: reject packets that are smaller than the size field
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  4 +-
 2 files changed, 57 insertions(+), 20 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

