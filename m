Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685787;
	b=E9OgUBu7JnXdlP1PtL/0InNQPCqrNBr9sQ2tUT7G3ZwD9H6FiO12B3PVvDnlT1cGghW7
	 T8vngXqTkl0p6uWk7DDrtRA6SRdHFgw5bGuOqvrhLXgO9UDC0imq4HsozC6XhAdnpgF3W
	 +JI6T7eUCx/2L/kw+WCdI8VDsHgmBOKrMIALq6mGt8V6AnDufSM89y4hE2B1tAZG0087I
	 aV5kI+qd7+C543WGHqHzBTwkiv/a7T4C2yrUMmar9a2RUKmtfpk7rhLHej9MniPrwV63w
	 8LWBP3zZqpYxo7rcDOKPO8AXmBW6GLKZeGSEIfsBcDlItVQnmI6zEE1BlsOelJjDvaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m2ZVrda73EWxBkRUvFtdKWN3BZuF4nfCaUMaOzv6QpM=;
	b=j6eFYK72AvZPwnfI3wlRtBdj+EauHnUXwnu6biybkZBOLgYob9M+qdr2rQKWwxKTY4Ul
	 V3jDO53l6XTYsOdkv2tzkd6R1YrVqZHlilYFZNukj7A11+4S8Ffw9xRXzQxqF+xdsrWYw
	 ZclTxi2nkMjxXazxs9+nkvWBmuARlH3LQVMK3TeVlTuFCYHnlvxSh9R6UPuG3O6014jUV
	 3pczv8qFeaTfvzCmlxNSdVzLhocaOYM+SQSCa1hbFiiLCCbiRGCAIHoYiZqXJw4JNvVf0
	 AlrY7/3h+UYzNpTHXxS1SYP8/iNWoG88mXBTIxERGiKX5eELS4hsyvhEde+i52Mgytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwtsGT7A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehBZ3QdB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BE7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwtsGT7A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ehBZ3QdB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B8Uv919527
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m2ZVrda73EWxBkRUvFtdKW
	N3BZuF4nfCaUMaOzv6QpM=; b=fwtsGT7A24PMeOrSl6GZA/TpSf1M7samQQwBzV
	oRFMRDTMcMLhh139mptLjnYAvYvqeAHVOAC/mCq5AIRTKXx18PC56QsmjPF0KuS9
	9SSKoRvd+eNHfrC3blC6SX+0eq763kh4OmX/2H32+T8zLH9yyE0fCwDgLizM5FLu
	aJS5ryC0MeT4VhLQvuOq8G404UKhqBD2WuakUUlprjy7BUUGSJ0RBSpBhotzwNTU
	UFYjAoWDARQN1XhqWs+zYLu7Vkmcp+fOBJcYxyqEp8/+RB+LkuOiq5QyoGuORRAH
	PIVfHNAAL2txMB4RX0c3rFQYwFIjTv4Qb3I+aj765GW5FxSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2exm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1030558685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685784; x=1796290584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m2ZVrda73EWxBkRUvFtdKWN3BZuF4nfCaUMaOzv6QpM=;
        b=ehBZ3QdBtk4rMPI5g5xLnR1LwvMx2B/LAN9i+L9LE+nCOyKaE9OEc/gnzpZT4hoh6h
         g/fRU1cC1GUmsbr41DyVP77iEh/nHwEPyRPZzs+wAugGUFPBIHp7pllwp5bGpwjG40xz
         eShs+2GR7tkKSB5MiwPS/f52i/S8mH1jkPyZ1YE+5qKXOzZ9T+oSYPRx2giUMtWlbqOf
         EHRf7aM+T5kqcCqFXzYTTNV4YF3Q/fYKYFTxgvPtPGtwQzczgMt6krvwLYEkp2mUK54z
         tlGXyRjl8o6biFe8+brHeGzhOm4s5BRLha2dUR9kGHMz+QqCY2ooGv/5PJ5gBAbN9j6X
         NIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685784; x=1796290584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2ZVrda73EWxBkRUvFtdKWN3BZuF4nfCaUMaOzv6QpM=;
        b=ld1f3Ywfk9pb5TZU7TRsOeUz+k26+NWYsIr4F7pQCBAMbDGV80cyQSUUot3BvxfiOQ
         PZU2GkoBU5/lntyE8y1bFTzdH/mcZ612tScSyfNBpaNZ6ZGUsgOkX4Pbw3s7bDNCqK7i
         Fn6ainBFaa+vI0+6TpZIyfT+xTxitrLDKy3tHucvOxWSFr/7Morbkvhq9h4uioCILCj3
         7A/obcTmKliVitMXCACsge0WtFCmNTWeriSG1PpG1SszeKrF3Z9ye3hM2jRsAED0rx0r
         KcfxdQMztCeVC/UosVqhB10DK+8kqylKChousTDjErZlN7FTAMl5B5bIJEJ09A1Dzw8y
         OR9A==
X-Forwarded-Encrypted: i=1; AL+hErG2N+t18983fQdyhp5sSm2Nf+c4BqX5H+/AJ9R7p+xSvPhQaLHaSCxstSVQOS/mrFPME4hoQyG3WAbTNYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uva0yTnJ+PDyjwt6x/6oIqPNcHosqwlN9WgXJysGnTtczUn6C
	d9DZTukbmvW4C6KKsxRMh+B73GmPe8PoKpYd+LiXvR+zWqY78K13qwIinN5Wh7Tj32/LITUm+oU
	9PX1mrd0F4BgLLGBl8lHPWutAuwLTwzj99Zk73+T1rab0pxCvUwC2ZifsTZXCjt00SHs=
X-Gm-Gg: AZFdTZfEdJnLGG/szmi/buHlyqGLNOGSpXcpXt1NqjuxOPbkCKSK2G6jIb30B4f4Hba
	JFIWI8n8g1zBEYuizi9lOGUvy//5eIIHmN8+9LkY5rpMl59p5IXdLQ9hXff5hNdBe5Yx9qwUPZu
	wxyGOQ/xy9XjF/2pOWxGRHJ3Jt3nizmZF4NzMxXY1OEh2XRaXtMxgrURvpvd6GO96jj4uCEeZRQ
	/KANk9qhrgcc9/fDsxS9Sf+NE0So4fUk87tpJnSn9fASN7/8MOu2Uy9/D4TVWxXBOGJ2v+wzS5A
	Re9r5Lz9SZoiECKrUs+QuJbdLyTkDazmklz0VBBwNyyLLsXDEQpj69hdnDgZqr2l0nHw62QONV1
	5T3dp8kMcVeUWEo9hwZwGCZx+fGS/vkNuXKICdFaHT354OdsxkooT2k3xJD2MYtkbsTb3lFSmLr
	3jZg==
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id af79cd13be357-949ba9acb4amr3632980485a.37.1795685784366;
        Thu, 26 Nov 2026 01:36:24 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id af79cd13be357-949ba9acb4amr3632978385a.37.1795685783907;
        Thu, 26 Nov 2026 01:36:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 00/10] gpio: make gpiolib-shared more fwnode-centric
Date: Thu, 26 Nov 2026 10:36:17 +0100
Message-Id: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJH9B2sC/3XQy26EIBgF4FcxrAvhonjJpJn3aLqg8KOkKg441
 mYy7150upjFuCE5BL6TnBuKEBxE1GQ3FGBx0fkxhfwtQ7pTYwvYmZQRp1zSmklsf0ZvAFsfMCj
 d4Sn4CZtSSVtTKIWoUPo6BbBu3dmPz5Q7F2cffveWhW23O8gYzV+DC8MUS+CVBaZLrvOzj5Fcr
 qrXfhhIOtDmLvzJYuLA4snKwWguTKFtQQ8s8WRxemCJZFW0AkFzo0sBL6z7Y4AAl2uac36sgL5
 UBLw9cnOTjbDO+L+p2AYbIEa1j91kJ+0XCISVdSFFLWRFWjcT1a/nbwgj9MSH9j3V3P8Ab9fDH
 L0BAAA=
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MsHoYN6yCMgexBoYWOdtY5nUtlBLe4jKr0qoObXf+S8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2TizRCDXWWdO+GCTIyxdYiufWLOnLVO3Yiv
 Ca2a6kh8/SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9kwAKCRAFnS7L/zaE
 wzcnD/0WjKnpBtIlIPZTn+PuwmFRHBMBD/b8swb1Ji8RcrtDp+8jNEmKWoGWP6qjqm3SulTZXxa
 Y004qlXSo2hFONfRBUNwOP1MWPB+YoKZxZrMcXP8bF2WNML7Hxsg87VgiMZID6CCI+HwU9XZhor
 LCic4cw7xsCvZ52J1Ra+E2KLi05VorXfBfqEa6/vG1Dy6nCevIpWYH8YMFmTuf8WgOk6b28ufdf
 uEBdnTfTyqBhonxJ8SwaQvaxfa22/Oc3GWbMJ/L2ADhj/weANSv3H9ML1ZGR0ac2sZr3/irwQTU
 4t2z9kuOL9k7e/SFUY8OyRL2ZTVFBatA9+zZ42qMP1q2cMMlFUSI+EbbXY3ofnA+ugx7S1HRAwA
 MYsCoK9wROKfzyv/ni6yVNj3XikMtPw7Yb4/iSz4OpueyS8fz46yDNk2jk7ZF7zHEqNMNdOcvg/
 8dVWH4MsU7koplh1yTn3Od3Zqds/cumQUu3Lqq0uxmb4NIbMIjUmNa8ouI7PZAIZPcZoW+bRpQ/
 bkUoLQTpbhU5V9kkOBhIZGxDaqcuvWq0FoFcE+B89rfNLZ8Y/dtoLdao9LlNVYw2vPS6hdUuEaH
 p3pddjQB6RK9Ub5P+hCFHlzY8Qh767UpKgxvtgdUKeJWZUQc2WH1V5osi9TVleoXKrzWsxHXZCm
 wPhvu8PeoETzpbg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX1XH6pGep9LJC
 /byRYrL8fKC9yZEXJcIVi8fd7umBpGkguPaqBqbHQiz23yoQXKyy/qfOjaaqDAontk4IcDFiweg
 3C6biXfrSgkw7xgeNvXP7X3LyGlkjRe3b3hGn5GGl/Q++R0Dw3bmra4Gz9Kyiq7bEXrEmil4gTd
 M+AdPt7IvI+3OkDG1ZbwSYU1UONeYqFyKZCZniVeX5m9mA2zahcfL4dJ6RLP7UWwzAyaxi+C8aN
 Ju69/w6kzaA2Ed/pZgGCVo9dQPm3M8B5dBJTeSWpPVd1BOq4vTAhwCxvW4JZ8m5it0cpdnAZZfA
 n4/Jotzykhbywju8c7pO9wO00CTIhfD43AGbmDsmzLYTeztrQIlxRsPea6FqhIOvM1GWHbr0Gve
 XCL7oo0FRM1DNFku3Pd5F/mmWcoYSV/kenEu+MRlGN0ggJhdYQbT1z01kZ3ZghEJO5Xq1attayP
 D40G95OoS0j/j4AnniA==
X-Proofpoint-GUID: jRZuzXa6l0MF1meJRbEWBHloujXQ01U5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX+ViMpdUIfiHb
 4KtV01fVh80Mq5FFhZ7ozTC5Mu+cSrlaBKd5BWd58yScIRU0bv+ptYVjly3cta2HR5YrWTv6R8L
 wBIQVZaQ9n4xKMgkyv/Ood2BlGouAIA=
X-Proofpoint-ORIG-GUID: jRZuzXa6l0MF1meJRbEWBHloujXQ01U5
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07fd99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=268TmXAmZi7PCZOmIe4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch adds a CLASS() for string arrays. The following 6 define
and implement new fwnode operations. The final patch generalizes the code
in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final 2 patches via the GPIO tree.

This series depends on the series from Alejandro Colomar adding
strprefix() as indicated in the b4 tracking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Rebase on a smaller bugfix subset of Alejandro's series and go back to
  using strends() instead of the proposed strsuffix() which doesn't
  cause problems ATM
- Pick up more R-b tags
- Link to v3: https://patch.msgid.link/20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com

Changes in v3:
- Rebase on top of v6 of the strprefix() series
- Initialize variables managed with __free() at declaration (Sashiko)
- Unuglyfy the usage of IS_ENABLED(CONFIG_OF) (Andy)
- Pick up tags
- Link to v2: https://patch.msgid.link/20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com

Changes in v2:
- Integrate the series from from Alejandro Colomar adding strprefix() into
  this series as a b4 dependency
- Reuse the existing struct strarray in the new CLASS() for string
  arrays
- Make sure that props != NULL in fwnode_property_get_names()
- Replace string.h with string_helpers.h instead of including both
- Tweak the kerneldocs (Andy)
- Use size_add() from overflow.h
- Mark gpio_shared_fwnode_traverse() as __maybe_unused for !CONFIG_OF
- Return early in the OF variant of fwnode_property_get_names() if no
  properties are defined
- Add commit removing unused leftover code
- Remove useless alias variables
- Link to v1: https://patch.msgid.link/20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com

---
Bartosz Golaszewski (10):
      lib: string_helpers: export and rename struct strarray
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: remove unused field from struct gpio_shared_entry
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 115 +++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 239 +++++++++++++++++++++--------------------
 drivers/of/property.c          |  41 ++++++-
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 +++
 lib/string_helpers.c           |   9 +-
 7 files changed, 312 insertions(+), 123 deletions(-)
---
base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338
prerequisite-message-id: <cover.1795639368.git.alx@kernel.org>
prerequisite-patch-id: 82777ef50a2bc99b1e6f163a2dfcb795093d391f
prerequisite-patch-id: f2667cbc4cf347427b2dccb23e19aefff373b3de
prerequisite-patch-id: 62b224f17ce0f2e68e8963de1180d9764dd24fe1
prerequisite-patch-id: 49110713d1b10ae2972ae738da383215d9be001b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

