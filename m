Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165180;
	b=ySW14YmePqAN7T9LNGvM/NxxbaUnLUaZYVRGpT+6D14XAjFgxW3KOCOdGlBclVZGjti6
	 h3KbC5rOw/PxTWjMOscVZzlf2BVDnuHRnG8yDEu/XuLK1F/kTTmFJ+wr2KdikChNfC7HI
	 0Kr6lsQH3Yhvv6MP/clDR93t1WkFd4fhdrIsXLsxz0rDLo/UKCb1G5DzcEMJ+MyFbVoGD
	 Hh5FS/wmxZ4JVfiSwAy9zc0gLXIE6LlCZ8U/rY7OHm/sB0I1Pf5dCPZbhn8z2TWVbkCPf
	 zwRr1JCcGiHWM+pLqrFzKigNFHRPRvI1ZchuTJlqf2wWR8rl0q9XQf0CMQKIAQF+x4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
	b=ur/OO1i0esdoKkXZ6RpKrbuUM3gRVVVv/6TuGRY17ntKeAGDgX6xKnaaMfUnTklbse7n
	 ZPMhltCJUoEFQAuLERrTwY6Tvori24zqHIgRF2+9BDUyn0VddFvZP4UsIsU7nBXSR/xc2
	 YtJ2Ads1npRTRbfVW6c/n5fopJK3iAm0PW21BNd7oj0wI2IKnkXLRmOVwMkHFc9uGawWt
	 gHj2hHwOKT0WL8GPr5fO6HOQMccDd869SVQXZFBSe8Dg1TRVSQCj0R/kPvkI6O3Tk4eh6
	 ZRuOfCg9uAfLSGJQ5uk6TJzXF7We72neQix6mAXcGnREDvnJ+1+nzTaV4vKrQliFKcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53964606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53964606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2NM606057
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=; b=BO0BDJHHVP5a4Q88
	f5AOBZso9jP0CqVvq/jzpZ4YXg1gZ80sQqxBQhuOxk38gzK23+d+6E/XnupWkV7S
	kXEGgN11mu5Kbew6nqnca+/Fnwkkp6h3s41P/Zpr+Esp+GMvwHGkFjI3Y0i568Yx
	Ds7MThrfrA7j0AsjNuATNThYtO7NRcZUKf8mDr1/2vHmZ+PvVnDLhyFRl/k2GELB
	U3uZTgB05BxXE3nR0EN/CKRYQijwjhScCwVATg1VRG6NyJVEi8xavWBMFN4e0d8Q
	mtYm8m/4Qe86Eyl6/H3ZM4SsdA8AdqLL6I/9bIE4kYo+1nnWOV/a8h/bwN8EcHBX
	dtf7WQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrq7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so799395eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165170; x=1795769970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=ElOsWj5E9b0TS9gSBOn3D3+hcgB/GUZCjRBIuyrObE3uwE1pvQ9r1KDCi+Q1vQbBAv
         cuw3VEF9lL5wDqgSCGijg3r31M7+gAx4YJUkPwR+mOdUMsDaWU9hFW0wLARBodkCG73j
         ONRPpCL58WQBa45Y3w6Us5kpDvuRb+c1u86LoOybFddNRaQ/5ozY0ScrK1cQL4Kz0Lgc
         orGheWUZgR/j5Ahv950l/BIREqdRFqYOn6V/DB48PzHGBgVjsOhA8IH7+DvagFFUTi/U
         fhdB3aE2JEz/uUyoBvkgHACwhnhbua+vUb4cioh2gQqYjjENG+rFDLceFZMAivjlfOQT
         jlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165170; x=1795769970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=mTcL9bPf5PD91UuNHCI/kE+fKWYzyFpK4rKgA1pQlTHC7/MxkDCJlaeCMnY+HM3ZHz
         kFTZAoV6JL9vNXDPi8jzRbm9ZSIOJbBApGfdZgm3LNI49XDku0qWIGnYj60b2HchHK/g
         s39oxlou+T8lFv/2X1RrOcZwmmlYcLiIbj/0oLi4EcJ8uLJINqTE9R3FU09j7u3ok4+K
         AOXWAw/AfnFnWRtUn9omVPunsW1NcjoTJRpTqDnyUA+Ed13nmDxRvMQMKwLLVzVd1SaK
         Ld9E5DzGFijtqwnLjIkFj/qUWw3aT8xJhFzX1iT6xAZ7OXXEWOJUqeUSu0s4SDqOyDoF
         fsRw==
X-Forwarded-Encrypted: i=1; AL+hErExe0jGZMev9qX/10MgYfZ4JzhBvoaxD3B0Zac+puIWdmi4YO1qJx1gtoZ2QA+0rW1fh4FrobXWM/eLNQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yAHAqCOLApW4fPQm28n9bmZ+QJwdHexmtCkR6sO7Llv9MtZUq
	JH3XtUQt5AwgAivzHCu/tSzqLbQWQyJQWw/15iBJnDU2k6p4dHVdxPEpZC1ZzDLzGIQMI+pxSyj
	d2+/rUEuFw1JprzxOqrxiDu1teouDhWtVZeOc7XahhloPikaYbANoxOBIxJghzMDLsew=
X-Gm-Gg: AYBFou1vjzQyze2m/8AJ0HNKfNWqhI85qsXUsN6yKTlBcwZQwg3apn8/2Zzp6vMGeeg
	/504iHS5FdsauMc4UfV5zl+vQm2uAvUdnk8F5PbH0CcdGcCbpFc+gqIpw/51hGDskXyl5Blj3LP
	moX6UvQoTRg2zbGknQrfcauxUjpeyWteyGhubD5SE0/CwcldibziPcE4TSlgX9ckYPjTHbAz7+T
	6CqFTfIKctfoJGSpt2IyVqPwAg7+Il8nJzJEwtkXDzHTi6E/zVjEaPavblwH4V7i/bmnQzjIwmd
	4bJpMGylVnzrzRqpXrtH/gtbCbGN9tRYyxrziMX5wVU/b9nMyV+MBedVqNtk3GG4qOmn7IPFXCi
	/6mMzvs0lJdjoL8/0wjMhLHunvZLDZZhvlNGO4xzA5cIX+p+hGocuOy02GO7zGS2m69FxM59TZr
	H8ZUGgQmorUr6ruVKWQA+ByyrHRhLgGfsZtQpCwGGc9rMG4HWcxcuNHhWeBUJKFh+Not1fTI9D0
	+aoE4WybiI=
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380939c88.9.1795165170158;
        Fri, 20 Nov 2026 00:59:30 -0800 (PST)
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380910c88.9.1795165169700;
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:06 +0530
Subject: [PATCH 1/4] arm64: dts: qcom: ipq9650: fix the TCSR mutex address
 range
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
Message-Id: <20261120-ipq9650_various_devices-v1-1-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfXyR3SPRquhIHx
 fIoNKuaV/LptYolIkr1K5t8PSBtZKeuRn+0dmWf40vJj59p3fcw1uW6uyE5cPoAPJqKEK1LDgHb
 zGxLvZESSmFCBJwMOHub8NGu86D3jHLrGFbaCU40owNkigLXqotX84gr+lBxLTaCa/IJnIb9ztW
 fon+LWGfbGKkQfju0TmgT7Oxl7QP1jfbw2nwuvcKJA1b7VtXOuFLQ+UCIfN9aOcGu28y+IhCSvP
 L9Kj6QDhCSdfw4H9nf0GZGcl11cFQuDCSpBfIocnVXvYCpxMsJgk4ekzwPcSdU9D+TtVYvfiL00
 JYMnZ84NTPavKsuDl8heRAjr8YCy6ZV9VyBEYiJppj7co5Yh1YaW4UFXxInrbu0xqkgqO+DMw2B
 ogh6/nRSr904TavnNKFlAMS5forqc/9gsfZxfxfnO41yNvTkjgsleEhdRGAAH7tRkl30ZZN0Gx8
 hpAVJL/znH248UqQhQA==
X-Proofpoint-GUID: TBXJoh1euUvxZd0nyW9vHNy08sLCF3Cb
X-Proofpoint-ORIG-GUID: TBXJoh1euUvxZd0nyW9vHNy08sLCF3Cb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX0720Q749x/UJ
 lf1XwPZC0HIGut7S/mbb4qgOzooPpYnOdrC3iIwJNtpYCh7PH5FFAfqEkQhvlqmhnIPcio28wX9
 wf0h8+WM5e98gaIT+JUaAXu7IhHR3Vo=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000bf2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eUx0VPcQqj1qSSogbGIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

TCSR mutex region is 0x20000 but it is mistakenly mentioned as 0x57000.
Fix the same.

Cc: stable@vger.kernel.org
Fixes: 8cef25a0044d ("arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 9ace638e43e2..94269c9c8d6f 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -385,7 +385,7 @@ gcc: clock-controller@1800000 {
 
 		tcsr_mutex: hwlock@1917000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01917000 0x0 0x57000>;
+			reg = <0x0 0x01917000 0x0 0x20000>;
 			#hwlock-cells = <1>;
 		};
 

-- 
2.34.1

