Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426525;
	b=qrpNuUwm/kJ3HFi3XfbIulXeGuAn2oBYXJVOohikeF56/88P7+srT6AsbyLzS8Cp3a1d
	 0tUY3U/BDQln4FBxBkjkCgyMeUNa11m6t3ooQm+Koj+DWW6ec1LZUsB4IJFEIFrRqL2nv
	 g08BG1P8/e5sN0U6B6A2E0vCsHTww9s4p6lVQBcTdn8oxFO192H5Tyz4kV2CjTG2XWj8T
	 IVL+fcxxUDray2ELNyw7X9RkRpypSUFr9DNvpq0fCiv6h8/ypubdQamYRYyEmpm49yTK/
	 PUOAz0HonD2etez4NJZXDE7Gz/L5jw8ZFMC/LT9mvdvVEYPVjM4/ToYHlp/C19A+ckA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
	b=4haYmU1GcIgSDHKdAdNLHEBnvWMRJSWibQ7pts17tkb/ngUsBVc//1OiNopsidrUB4E5
	 KYeRk00VI/32w1nTgy44J2aYhzgGbJYR1/ADR0u2UefeT/CUYrCIaop+VNONByF5nmPCD
	 21bRzT0ijPzfZbthZq2NH7ypptd85xQ+CP/kLBKLVofS1D9nLMC+u8F3PpRK7FT2uhQz6
	 7SILhGV+YSwFc3ETCcsp+1AdExu1duVk3vp7LlNPgWaKN5TEtV+HLnDlXT0mEb1O3ON/y
	 fBxwHjhNm2GUE/JEAiDve2JUghSs4TqmnO439faxGsBKthACGNOsqZMUjXDedehVU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eh6lBDN/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OI/1ZjY2";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A847D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A847D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eh6lBDN/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OI/1ZjY2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G75Z4095714
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=au/lqSIvjCDlFYBkZ6wmQ+
	r9MXW9GHZNgvB5cJ3OfOY=; b=eh6lBDN/hjrP4yUwh2eoUzSJnBsJzbL2KDNu/U
	kniV1nNKl0khJB4oKRATUG822+e8uuClO/8PkC/9pXCihRWp8RarQRrOncBFYPSx
	HB8aqPIHfU4mIgcWybFW5WmOhX7lTRIGFLU/3YJPof71BBb5cvq4av4X0AeG6MnA
	/l/l7XZKcFRWruE4zTT7/xQ69J9o34wCQeGLg0nmp7PysKrG279FD8us4fFnAgxV
	zSKT6ecUuYE864q2lMOXUPoqwjkEZ0+3K1u2QLgNlru48TvDsTSqP+fG+PAXIZ7e
	10HlpmEWFIqPQ1LvaiW/zBJAXjK22e0bzrq/Qd7PFG5AIrYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740q5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so501517785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426522; x=1796031322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
        b=OI/1ZjY23x9IoopzqGY1jGeq73sGWdQ7+bCtf84KHBoYaorxs428m+So7hT0slVONF
         mj11hMRv9MKxviLMfINCP5UsaOPMwVyZHnSYPEJzt8ATaAj0SA2+twA6G6lH1wqnauH6
         4eD6gLXjA3Gxd/fh0UIKSu3J8dPiupOoFfIol37NjU9U42iYICh7aAjeJ3DGTpbpeHFM
         Eo9DwiUkiG8QcL4dR6rFSXJ+rRx8XPo0kruS07TI/w/4iUnzUU7uj1UOeFq4/WTJbeI8
         e5xeow+AHXlo4M/rxjSN0ucrdRgFRslA2zmceY/F9pUuFN56PTMzxeFHYAebn9c65Pdl
         kyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426522; x=1796031322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=au/lqSIvjCDlFYBkZ6wmQ+r9MXW9GHZNgvB5cJ3OfOY=;
        b=z+q5HH2dQfiQnErwW8q5MvojQESCVrYTgfke+BPaHOpdmtNpkZt06NgPLgtjeQdfSJ
         /+gvMrx4cx05+v69YKuiNRaiK6Wde7hRWUv3+Fsq4mGa4C4cFoZWDUM17UApaWqCR1Bk
         gaUo5yRiSLiXn+Wtwrwaw2OXLlM1sYoaAs68m+/kjrxOP9fKhdTK95ymDTZSrPkrvpUb
         HcaeH9NU3s6ZSNfNA5jlid/VKD5UKw2kdJhPebHpbPhOchmG16aMjCKv4z1cT9gzJfce
         ehnPyOihlhu3Qqp1n+xux6bVu4vgY2aEAMLiuEjY1FKOmUS+2CcESSDbSwFZaWr4kGbl
         hOCw==
X-Forwarded-Encrypted: i=1; AL+hErG7JbYBsXS27mQK3mB7Cqq9081CQ0SbOT7maLaW7kqEUBYeIeyPERxRKalz7RTgGFsOfJhXvSxMYEZ1QsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//bcPJTQKjBa/WM84ovwC5MzyyI2kIiU1NouQs9eMR6gdoh3oK
	f5SGllY5bQgwXwsczdi6j6KYJ0cZvnrK2EGiJOnoFIejtbPaJDPwXhrntk4Tqe6aVqHbaUWmuHM
	FC9NgwU7DBMFGMVRJ7Kr5tyfM606IRFftPcrUKpm4jGNIJksCkp04UPvw4ALqwYY/xcw=
X-Gm-Gg: AZFdTZeoxyQEFv1L851ejsW99XjPKpKBZow4T1/ofMLCOyNRZmJMDCLnkGQNHFKcCu3
	DwGix6HLCVTLI3YmTrvHQGGiA3g1/i5afDSlteX45Nv3hPuDjovmKaWnVOHSBxTYVRue0jJQsbh
	GzFRrRKN1p6bHUoKgPmdH7iTf2uTPsSF8fwFjb1fsaO/rlvT5cX2dTBuwxGlrGocum3zbjWeCxO
	x6Mj3HoyhsfsGK9NERXhiy4sH9o2Oy5VBUZ4LrMo1fhsu33gZokT36jo6XUFcRwGqrOsE3g+stu
	3iKaZCyfCdBPLFo2vXw+lb2CfSH1/JtR2TgFeyRlaMsPUhLvAzEUBDxK7MpE3PIZvSr4hApMKbc
	AWq5qFVjOIWYFC1eOQoOSj4e1ghW+BbXIB5xosPTpDrpL9akSnkHbjFp9vg==
X-Received: by 2002:a05:620a:bd3:b0:93c:6417:f9c8 with SMTP id af79cd13be357-949ba9b3e00mr1900371685a.29.1795426522072;
        Mon, 23 Nov 2026 01:35:22 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93c:6417:f9c8 with SMTP id af79cd13be357-949ba9b3e00mr1900368985a.29.1795426521455;
        Mon, 23 Nov 2026 01:35:21 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/4] platform: arm64: lenovo-thinkpad-t14s: Add support
 for the Gen 7 EC
Date: Mon, 23 Nov 2026 11:35:13 +0200
Message-Id: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANEIBGsC/1WNQQ6CMBREr0L+2pK2ViqsvIdhUcoHaoRqPxAN4
 e4WjAs3k7xk5s0ChMEhQZEsEHB25PwQQR4SsJ0ZWmSujgySy0wInrFRKGItDpqhZTLXp/xY1YY
 3FuLkEbBxr113Lb9MU3VDO26OrdE5Gn1473+z2Ho/tf5Xz4Jx1ihzxtoYq5S+eKL0OZm79X2fx
 oByXdcPQF2M5MEAAAA=
X-Change-ID: 20261106-t14s-gen7-ec-297593bda0fc
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=blI6AwuqcaJ2elfDvzAakaLljojAtt1Pz/ZlSN3Mziw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjS5xxW3Ev8QtMtb8W3cIPQYDZX0CxhyqkU/
 DKUW1UeCHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI0gAKCRAbX0TJAJUV
 Vo7xD/wOevjc+K049UslrZSx2p9bbI5v9Z9GkeHR0RsaA1cq4pk495alAZlD8e42RAHE4jU9Jmn
 euBGuwxGG0oVPp0h9q4brMlVX83be5W9qdP+Jh5Gt5mW6+GBV+6cAXIFfMRxZLbUKv3hNALbReB
 wz3WQNZfEJbBFRvgYmGQqtuQ2g3+JW6Tv3z8rHr1n2bcvYH5+Kywrw+R5clVDkdbXGLaQ+f6SBk
 zf/TBvLmiGTvuFLfBnjdxhQj2s75WqIX4oDrOsVPp4Dj/hnYsgrnJm7ElkwKYuLroUPncn2i1wF
 VPMkGveouIhzRk/+lWoWmHHFqfzPlUTvuIll02rf7LQPcxsBAG2DdYXmMN+a0aCJTBlHQdKX42c
 D2RaX2MtAh2HbdYyIE9bq0nciKD3AOR1sqTg2ia77oAuE1fCFS5chagQNXhQM96GVGjJBy2nAC3
 t51/+eFFGJ599p4cowhrN1iyIyEy5csd5F/fbXv0slFDMU7F0E5oYWxEtIhW4Js/MxtJ/JERs31
 zzk9TyY84KFf/pBn/aPOvotltcwU5cIMrm676KBRjIGQ+8xuLjAdNoNgi0qf/33eVekoB2jese7
 m2QUP2JZhvx0fSkMXdJ9gNnb4nd7RXLagVCNCabDE4bweBeH6OqmSKIS67bZeq5G2pD+8G1grO4
 ka0GZRhBRF0z/Qg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 2NiSvrLwNsxis-BlPTiWGWCRFYaZXQMq
X-Proofpoint-ORIG-GUID: 2NiSvrLwNsxis-BlPTiWGWCRFYaZXQMq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX/8VXKerB2waN
 wD0gZ2tTrX+Ur7zyE7+9PO3zjgyjY07KhyiuxhzZIbq9r3xiDAOHwkB7odI8SMcARROefps6NnU
 wU1biI3Y+xRSDkx2nWDANEukZmNMQew=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0408da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=L8UcFDWDmyMNVybWMAcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX383kSvkaNtvI
 QgbQU7ZUvxhhBm1Dsv5oFujyBAa0T8DzPoJKlgwRCKBHWYc/LhFqXyWAMrY3/5Mwoqoj1zOnqov
 foLczFr6+kTJg87xX1J10teXW+dkkeluhw6laDfuBQThObulfPwaVbsY/oe6Ice/gbks2eqhGD2
 RiXLEdr7vUib5ayHD8SjEaXZnLhf4lLLCY0g6u5hyrf4rZ1KBw6ivQdG88eD2RkJoKBa3PDN2ib
 Q7FRLvPc+X9u2BwPc45LNOBa1b2/lKSJDLlFClaob2YhV+xFW2W2llY76m6+QJTl6UX37xIQI63
 EHzd8BRAjGGyB+suuZI1jKHO3fmZxv3Te97kOQ8NXI5TUTT7i0nQpILlD3GytV44FD9EUEohhyk
 hoohCJORgqzBPnLmJ/qYj0nGEvCMC3rSJYyjWS0j71WHLc5GinffBkGSJqm5cktFUN5+Medcr6M
 j4f9KgKOBnmghWx+8+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230037

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2, Mahua) has an embedded
controller at the same I2C address as the Gen 6 one, with the same
register layout and event codes, but it speaks a different command
protocol over I2C. With the existing driver the EC never reports any
event and the LED and keyboard backlight writes have no effect.

The Gen 7 protocol is taken from the ACPI EC accessors in the Gen 7
firmware (RDEC, WREC and QEVT): reads, writes and event reads use the
0x80, 0x81 and 0x84 commands. The firmware also describes the EC
interrupt as edge triggered, active low.

Patch 1 adds a Gen 7 compatible to the binding, patch 2 adds the Gen 7
variant to the driver, patch 3 sorts the TLMM states of the T14s Gen 7
by pin number and patch 4 describes the EC on the T14s Gen 7.

Tested on a ThinkPad T14s Gen 7 (LCD): the hotkeys handled by the EC
(mic mute, F10, F12) are reported, the duplicate EC events of the
volume and mute keys are ignored, the mic mute, speaker mute and lid
logo LEDs (including the hardware blinking) and the keyboard backlight
work, and Fn+Space changes are reported through the LED class.

Prepared with help from an LLM-based assistant.

---
Changes in v2:
- Patch 1: pick up Krzysztof's R-b.
- Squashed in Hans' fixups for patch 2 (added his Co-developed-by and
  Signed-off-by):
  - Gen 7 suspend/resume: set bit 5 of register 0xcf and make the
    power and lid logo LEDs glow while suspended
  - report Fn+F12 (event 0x19) as KEY_BOOKMARKS
  - ignore the EC events of hotkeys which also come in through the
    I2C-HID keyboard
  - check the variant directly instead of the two feature bools
  - lock the I2C bus around the Gen 7 reads instead of a driver mutex
    and drop the 5 ms delay between the transfers
- Patch 2: return -EIO instead of EIO on a short read.
- Patch 2: reword the commit message to match the above.
- New patch 3 sorting the TLMM states by pin number (Konrad).
- Patch 4: place the EC pin state by pin number and pick up Konrad's
  R-b.
- Link to v1: https://patch.msgid.link/20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com

---
Abel Vesa (4):
      dt-bindings: embedded-controller: lenovo,thinkpad-t14s-ec: Add Gen 7 support
      platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC support
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Sort the TLMM states by pin number
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Describe the Embedded Controller

 .../lenovo,thinkpad-t14s-ec.yaml                   |   4 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 126 +++++++------
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 197 +++++++++++++++++++--
 3 files changed, 264 insertions(+), 63 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-t14s-gen7-ec-297593bda0fc

Best regards,
--  

Abel

