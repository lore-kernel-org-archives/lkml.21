Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.253.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770148;
	b=y3xu+TLsmmUXQK6PCx+i8lkjdlLNOHS3JdCIYhsKnQS1sSMEGr3M8Iquc+13tHcU9WFj
	 E+c6wW4ttqnUnLzxQ2lAV/4m71wThbuG7Y3Tu2mw99BT7m6FjjUj6xyLl4yy6UQ+QklA2
	 epVQ1MKH/QKkoQ/6Ikp8KMkx8w200CG12xCFHDkQWY0EWFIssQQpQ5/ID+5wXflqE526Q
	 TVKyzJg8Stzi/stWQwshYs6v38fC4AD2TNxrPbJUYPUV+pzzanNhlSi0B90kzDU8dI/E+
	 vDSkTtj7AAD32GqI7wtAzn9rlK/qEpEVra/swDKsP47kanEnzbsj1D0/DiXY7kk76FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770148;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
	b=ofGfT0Hcai6m94PbbQ0ZySy5Y84xNsvfiZPO2OGEo+Q4UnbAARYlUoqrDWsoxPnbae7P
	 9wzrsSkFg3UCrSU8ZjxlXOvPA3qvs4CnM5ZlgPs3BTEuYvKKC9+KjvQVvAPaF+e/3uxbt
	 ILboLVWQBxARlDWxUoYLvBIrLjXMevkjGEh4pEbuXqmv/cAKSb9vw6Q0AYZyzBYtkYZTQ
	 pd2g0OqEcY5SX5BVF+p99K/iuDTvIykg5ML0XUUtpaBAMEtmdrNjwrSIlrE/C3j6qTwk7
	 LtfDwpFz3LH5OZyEvKTrLz9I/toaYEx0pZNCi9mHvUh3wGhdEXzCHLSuVxgMRNN67WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj;
	arc=none smtp.remote-ip=178.33.253.128
Received: from 13.mo550.mail-out.ovh.net (13.mo550.mail-out.ovh.net [178.33.253.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C21606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C21606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.156])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4jbS982QBrz62hV
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:02:20 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-qgh79 (unknown [10.109.249.183])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B17C181D82;
	Fri, 27 Nov 2026 09:02:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
	by ghost-submission-7ccd8bbbb6-qgh79 with ESMTPSA
	id wBV3JBtHCWvG7hQA11hrdg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 09:02:19 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S0086ebe963c-11e6-4064-90d7-40b8bccae90e,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: michal.kopec@3mdeb.com
Cc: filip.golas@3mdeb.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 27 Nov 2026 10:02:17 +0100
Message-ID: <20261127090219.3366764-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
References: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
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
x-ovh-tracer-id: 5123970479740088070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFr33H5/GZ57e8zOAjy4AbQhwCa71Igc6rICZvEgYy22LsZUcJYgngSL2TZA7w4Ee4abVHmx2CVSiPYNMyD1rmsOTDiAFMtT5hRzkjbQGdazAvQlyBCtPZdJge747x9Epl1I25W76Q0ncVJti4mrg6zoaE7wtpXDPb0Q2i1I2x+T7d14P6v9zzrDBTDIAqMM6IU9GAj5fA9M61FlNTKIaxauqoRaPenq0pb5efhKPlASLxbounT/dORk0yy0kVCOFKPxsQidMqVJHCsQlZPyrdlIkjQbPF0zzYp0Gju+mNOWSH4j0Di5Bsa9G03a1ZJAQq3SVvbh+aYgzZpXZtGaiITDRsbDgtYYbzGeKmfl+CiCBKkxo48X+9PIBiq/nYaAvsAyTH/CHxVsaYewy+nvLEkfQghPRUVHo+NgziODUk5YHSvHno4oupUbz5qkP060TzUEo78z49COaGuR9poe2i+YoSscgFRyN2iv5PcdjlwYmunzPSC+ZV2vHKBqfXnUWvAHqVWaHi3NWKfYAOrIOfKb/9Bo47qydDSywwYZWvicqMBH/oVn1a7TCmhCWOVYz18HxjiHK3kbhCYvnkfnn3IFsIWtP0qXF+LtfA5Vih52MJxMQo+1b3hN3Y3ZCB27oxJrNek4sQgAVbxjKYwys3V8+ptyEdQla9u9j4bs1zakQ
DKIM-Signature: a=rsa-sha256; bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795770140; v=1;
 b=mNMbRpsj9J3U8fieD55axxz3YD74v7f+H91p08Nj5uMeigZRI5pK1JDkckS3MSaj54ZMlx4j
 HqazIVs9D7KKHU35RnxNGDQuKHPDvD69I0uvj+4iouXXTnH/cT4jNin6dc4vFgx8asD7Ss8EZXl
 aPhz299onHj6Rvwm0s1D9ZqlsnO4jMRQ14kSOpG1su/7/GTNPllXz8C7PKvpzslH02kU+BRbij+
 Z4exVkETWzIB9xUvlDwCN9itRScTNjHefTbIt0xzdlWeQcF34R4R7R7mpWehK6aMB7iJNne/HdT
 7eB5VlxfxaFoHNKbRagpVB+eeVYE9njsDn5UXTCY2c8Vg==

Hi Michał,

thanks for the review. I've addressed your comments in v3
followed by a v4 fixing some problems it introduced.

Link to v4: https://lore.kernel.org/all/20261127084910.3355833-1-filip.golas@3mdeb.com/

Thanks,
Filip
