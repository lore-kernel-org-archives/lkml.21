Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.56.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771485;
	b=1UtJFjm28N5T8RvJKsr8X4MkRl3y8lpXdHwN5n7c9fw2jcu+/L7dG2E4UVLb+vVDy3Bl
	 gtLnNZR1E8VvTz82fl2oHQcksBv16DLq+n+NqHOAr76+dC0ktryp5oLs70e0eeT1CiYLj
	 2aUMtLKGXocnkJfHJpkpvVnshA0M0fmPwOpLIEAin8OrTylu+jYZiHPdDlO6R012Rr/mR
	 1cDLV0zRduaCZvNbTarEfKCxGgpqOBFY2WjetjebGhpLJ3/EAlFmd05WVybxxEDXJymOc
	 ksfM1XC4oPYF+h7fIPGjppmb1W/qV6e224d1NAx1YvZC/Sz62MX9UTDRZPdgb3S1QEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771485;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
	b=zrjX7G5M6cTT+0P7ZkrDpH1Ddsm4nGnh1XACxETacM0mKWeYlU5BP4LpPJLuMQ8W4YOH
	 lYR3wMAZfi8js/sJV1+zPAEFUZGvGUPZfZw/JqWuwW1fRc87X02jeNaj/I64dRujYP3XE
	 Dpf8emEVK4zlz8m3YFBLCdH96pMHVPWA+Qmx8sPUWE3FfkFbRQa5HtruAFYJ//eERPqSu
	 Pek/y9c7+ug+YwyNMS16sZE/72Xgjtbk307TzUl2oXmhHy1RPv4dPIY+0LvIZepdMf73h
	 bWWOoZ/C82EUeNBaVfjjnkaTFEliukZ1RPUErto6wBTPQddTv3/ODviN5IiX9ayowzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=a8ojFqMF;
	arc=none smtp.remote-ip=46.105.56.78
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFF0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=a8ojFqMF
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.189])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4jbSfr0xv2z5x4t
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:36 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-fkvks (unknown [10.108.42.118])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8B524C0148;
	Fri, 27 Nov 2026 09:24:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-fkvks with ESMTPSA
	id BUE8FlJMCWvH9xQAMqfShQ
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 27 Nov 2026 09:24:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00442b59f09-659f-4e85-8f3e-1b21a2cb2032,
                    D697370656FF9958A21AC54DA46BA3848F1D2CE7) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
Subject: Re: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 10:23:54 +0100
Message-ID: <20261127092354.2974097-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 5499739571757031070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTERTqOI1oZsiv08VZZ6wCeuxaP5sraS596JdYbW3aVQtcM3PtH1n6tj0S+zKg2BSAqfZatgikFkAIKpsf6nZuyqPQhCTH73PD5KuYVAzbKN+8L8FjG14aWlZCaJNnyjZyP+7h3jXgEpL4dw2madG1XFT5o3xCYZKdcjr/nGTRt2DxLbgbQA7xx54zPn4tqxGsiGAhYPvPxy2FyLZGr4T8Y0SMg4ABcAFnYegGKJ59egup1qQX/yRqE+tZk541zUQ/L2c6FGGoGSNmjtif6Ep5FgJctMIclh4qhWfet2W+BDrk33M5sNdfIXYl+mL3vzY9mOVeBDot9ZxAwS01lqEJE9KW+WzdhBk1LV/mW/2KEUvHOW3kWjgUTjinII4olxX60z6S5cmz8pcOi0WQTTD0XmvlVV7xNS3AyhUDxKR0VxYHnSJt884MyGMZOcHN8+hFrJY+ylsOH0/RV8o2KOhJTHYTCAGx+PsrDXLl+DmxPEErjKPoK0+pBnUywgIoOnX42aHU8bLX0GNo0s/VEjvpqzFNWFdiNmB5QBfhGy84Q5g/Wzegb8QwCs1qSifzIPkRhWvdpmwIhriOsubhlHZ4KWz1yGwBmp2PNW9FebL2pe+c0VDPtKHh/B2MJdXjPP1mNn7o32Zyowrst3xs6BveojK1XSbDsvS0OxtbjzjChAMw
DKIM-Signature: a=rsa-sha256; bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795771476; v=1;
 b=a8ojFqMF7UKwKKfSfG9pvbTjdnf8q0gKVtJa8r07Jm59O6xyjHwSsNmTW0vZHHlPwDmWUkWc
 AO6HGGt4rpVxCAHcBG2t6zdhQnJVOzFK3IpH+/keRjN5vVwYwCIqtHGGm4fEkUa4BfZ+m1AEcGy
 N6+eOmhYjLumDdkrTZU6SmwJJ51pWuUssI3aqCrW1hcrN7bgpK6stNP+2FunWbLaUMFuAOsRfX3
 SCRqDFAIqWTWt7EG8osJPdm4Az66ZOO4V8XIHF40/g+zmldKaao9wI1wuBgBOX7DmMHxN5tAIA+
 MSBFgWwW64O3KUlSdoRkbzX+1QJvCbcnlivPWhjQYK5kA==

On Fri, Nov 27, 2026 at 09:49:07AM +0100, Filip Gołaś wrote:
> Add the capability to directly control fan PWM and configure the fan
> curves. The initial version of the driver only supported monitoring
> the fans.

For the series:

Reviewed-by: Michał Kopeć <michal.kopec@3mdeb.com>
