Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811613;
	b=DFLwyvWxxWCHq5WUtMylzb8neiKxWj7ClXz6VGAXnSFdf/tTFGtM/4RQbYxGilf8UY9T
	 Qt95nFA3soxaohdC+cfDRd7Fsdnz5tNqE9Qt1dV8DbzrJsx/zTerLSp4scrPv1sRsbdq5
	 2I0SHGfqkEbwdlsl2nQTb2ixEWL4JX5/rnBedaveDsnWV0pesXqHezdBUveAQUFg7vrRL
	 FaTtQbIZVYQMkEwuAbDLKnxHbDvIfxnk6s5CgPeVoWe1xKpbh276A/0QeYXSaIzDkhh79
	 AiacCY+Vue6SlPMeNIP0UPaJ3JxAlLj3s2A4zSuouOrBos9+B2UW8AEq0FWDwjzYmNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
	b=18KOoQjv5k8xIgE94QpRbnIKzxJonHke+VtNexop0SyxJg9e9m/wD8qcNraywcrxtMVz
	 JA3kDFJHGVBTg9JNfdqZFbPmDNms5DlcbLCwcmbHJAZulTurShmrIpbQtUIZg+3EIzsCU
	 JO9yd/ztRtq+BW/4sr/vxMXX33Ytp1APCdloJ+4bfmoMbuF+CCVJcIOCe5PEHNLWiH/ui
	 e4huQoGuwLT97Yzsla7XG1WmpoNzB3lxEXbY7EJrN4dMfIWPFoW3d21+bjUTyLYFDQ/iL
	 xNM2f4yRdbjD2mHqx6cNWSMvJ7dRLicytXTIY3kENS60GFQvWjT3STAEVed8IQVAmaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79359606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79359606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAubw2454926
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=; b=D2MjMSugSyFOtWdo
	Sp1uUzUX1NZqgct7w1uRpBGcVaYMFGHXMED3izaONkec1MLq5ZlP6jIxP/YNF5H1
	Y2VGLqR3svxU9W5XMjpf2ZNcqV9j+SyDzEYBnlOBDXtjpT6XS2PATW4W2BZf3eHX
	NkcTV+DdzgdxKq0DKZbDI9t+auOGaruKHmcUCYOo72RaT4DvH6ZrNS+bJ8+kHarw
	zuqdjhP54iLWy6UHtyeprW5sIzU+/7CaiAzsBEetOUg02CdyIcG6CUPKkNMlwhuU
	ZzDuWOj85UQPBTCyVkur/MAPB5NZFfCHGdLiwfSqOYIcMtLDXjrDOKzrRyFGFPpc
	GR5LjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3byve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1523192585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811611; x=1796416411; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=L84DJlpLQMuuLX1474Zyqhz4pjYjnDMjU1URHM7HjHg75nD+197BbJCSFg/4s8Hyyk
         SVReOX+CMRX6BpffaDgIx1UDihf+AciNlTY7SiSEMtI7H3Ol4qTVHV499rjf4dJ7WFx7
         WnalSSOza2cqx7gqZR4BglJS4FzdKvQrU6P94Y1M6TmOWuAZm7ZMh5GuZh38OEu5zCxv
         d6qBpL4vQcA9OK6SkVrESbKrunA9T7QN3y4QosHcBTgE0umeOM3/7KIvrPVEQnwxantF
         0Ox9C+7uEsh0cDg/zqtMj7y9NTF6QuVglwV4XXB5dM5elGzvfC30kpe3wPpzUt79yJq/
         yWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811611; x=1796416411;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=0gqzkVDgonA9Ib84ME5I4P1u4hYpYVfOsIjjk4P7DFAMJiADFg0lu/SG/4MDkdzZQS
         UzS/PZcED3IEiSTd8GUwNOY/PF6tjK8bIEmKQCxh8xmK4ejvp4u4P/peOSAkNFM45E8j
         /wBs3H9LhACnY9QUxKii0k3aIfeo/CR3JOI9nbOduF9NwM/pJZiGgM1LjUA6zFNFa5JM
         3DJJWdFpUUTzKc/1xOz1E0cYjjakKiZwT/zA5lyNEEh5VcRnLBV7jiZkPDnaEuT4NQAY
         3L7LlygQztDOSuPvjkF+Ra1YFwUgeAQ8QV0SUl7F8OG9yHVy0Hu6J8OdmWrNGgL4bZuC
         Zjzg==
X-Forwarded-Encrypted: i=1; AL+hErHBngzKaZSNF82NDpwjVgNIGQLKF4qZXm23qMmld4aruXeRXMs40pkjNmKY1Nr6thU9nHv12offJehPfnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YuPG8g/lWpX5aYOaLS2hI6iTjtCx+LlPF1aRsaUatOUdS1LPK
	F9/ZzN3cCbLG+pXuXeZuDkLO9kocOXRkzlOAo2AVg4++BxBGCt5g5Ps5Ke+xChxvdT/Tg+qqyec
	+6Za7nkqRWgvpsjrFCsMmMBeYkMXf2q78ETXmXR2t8r1dnxxcHu+LmEgMSLKakvusraw=
X-Gm-Gg: AZFdTZeda6VEhQAlbfLqYgf/I7qCr1CNom5jEPLrdc4vLRbTf9TsDkK7zVjccSDO2xx
	YHJmKzYbReLrg5TBhfrsnd7W2Zq+mSuuiFo6Pt6tG4RxJ+D71mUX4f6BuJKNsRt/kUJ2NJxZza4
	C5Cx10mSRuMqMT0fsvvt5rapJ3C5xkKdoMTf6m9fsRO8GgDXVqQhHGiLDkmHsO3rDyCfcgJZst+
	EaMrxSYM1atniQsnc62cCD+Gwwk9BBfCH19VQninyYqS72EWNAreCxvhmyYLIQj0f5fmwGT9N6Q
	DUntZ5VNHjxf/A2BVnhMCtDknWNmvf4TZjcT5oy/p30qWkQCNgh9b7RhURdhbDl/K+Lwe6QAbC8
	X8AEmVnaYL4OUR657G2pHTe7K+1VM+4tcchCr93OjaQdxe1Hve1pqupMx/9gS4w==
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779005485a.5.1795811611329;
        Fri, 27 Nov 2026 12:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779001185a.5.1795811610870;
        Fri, 27 Nov 2026 12:33:30 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm46444385f8f.26.2026.11.27.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:29 -0800 (PST)
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add missing Iris pixel
 stream ID
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com
In-Reply-To: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
References: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
Date: Fri, 27 Nov 2026 20:33:26 +0000
Message-Id: <179581160665.3905807.4498492741251530885.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XqhMIJBK+RPI9EuGkx2IwbDPmDLtOjbw6QtNrwL4lU=;
 b=owEBbAKT/ZANAwAKAWNNxPBocEb4AcsmYgBrCekY0S2fVKfwIFjsjbQyH7g+1QmnebDfpTH5s
 GJhRi/o3/yJAjIEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpGAAKCRBjTcTwaHBG
 +A5sD/YqHN/8avpwZcoXmtTqsgBr2hSift771T4JYQX5ple18qgGo5YtYwTMuVRoH2nNveoBRZq
 VbBDBYwJSvoG5vEe6L/UfCDX2OrskZj6+Zn7MikoeXixmIkCYrjL8nhQPgMtbHjsxH0K2soDl+c
 nOuWs6M8/BV15dI2gtAJKhslnrbECsvGzkzLSMhs/bHID9AcmIdmP1TY4y2uA2gtiJQ5uFHMnbY
 WzBexs1oh1gWkK1XkAcp28UJjRMAPSeDWuOGx+PPyVpDYrW3PTKRb+NWL037ZNIPZ6K89hslAiU
 ewuoCKqGR96u3yDAoE3wV/FvugvjQQ7XvM3kzNN/zImeCDK6ISE8txwFhdvXIm2zHdDmYciaeOW
 ygL8p8up1FsRARwsqhL4DdB+/GkeQr/wwqRzlwmC1tfePUjJNbhB6Smd3LG8rmS82G9w62laRcF
 qT3i3KScsXMeJ+7bNro+qywgitWDEUCfHA1GqQw1Hnc9GZaVtqqpm3PCyUnbjkuc6Qm1XiQeBje
 gLVQRj3qpfcm0hhEGdzn4Gf8/O5yu3O6CtjY3QWGDsdUC9htgBs6LNG+H40Vdewzmk+ZdOafxBm
 U48zm1p6mNEWOw/4AJkzHqV2mme5pKn1BKSlOXx9+k+SA8YKN+U97aMpYunN7HtJFz7ppztlDWo
 cvEeeqhzWq64f
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09e91c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=d2b-pOcihrNWfEhQPYEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: o--sphuP65AAVYhzZJSSYiKYR5-kNfEq
X-Proofpoint-ORIG-GUID: o--sphuP65AAVYhzZJSSYiKYR5-kNfEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX5Gcr7lC7CDOy
 sewa4LpFSRC/dUikgOCWJ8NpxqdP/W+TZbqAvwHN5hqk7pcjonAa9HdU+qcgh5h2VL8Oq74Q6Mz
 /OF1aFKWx0A08RxrTvka12zO5K3+TmeD1K0QOdPB/WWTJLCzhLFyYHC2KOyLhfD8VxjYt/hJ639
 BLV+iL66uEkiCeTegMhGXngGLzjsWY/8rm7/2O3HwDgD8B/cC4/aJrkJHXtLNAny8i0LY/KCom1
 EPvYtCkH3u1xOiNHLJJMMMOYFuMd2w8qqLygFy7zUa5meScxmBz6Rjygr+knIfg5j9H/uaBFf7W
 l0Ls/G5SRQeUzgmYM1prXXj3DDIbB0q/XerO0To5+TtYR76h0OeCkXiGF1mqdYBBIN3YTWDSDtz
 pWbQSt7ghouSh92h3LYlW8SLx0FoETjOZjynNiOnr4ddVmQak/keoMJlQuLCAG0eadfc0rlHZVz
 vSRkk+ZJnMhzFeaPPAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX6weXVV9QK4GD
 an7O8LfvAaEfpTZuY8R8A3ygyNzk7FmNfZTqp2PFDCVsJPoL+s1kHwDMS1LLTyMRm+Ky4PkQd/r
 JGbnettfJ2IQNLorvKzdDQyBrIZPSIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, 27 Nov 2026 16:32:21 +0800, Xilin Wu <sophon@radxa.com> wrote:
> The Iris VPU on SC8280XP uses separate stream IDs for its non-secure
> non-pixel and pixel traffic, 0x2a00 and 0x2a07 respectively. This is
> the same split as 0x1940/0x1947 on SM8550 and later platforms. Only
> 0x2a00 is described today.
> 
> The Gen1 HFI firmware sends all non-secure traffic through 0x2a00, so
> this went unnoticed. The Gen2 HFI firmware puts pixel traffic, such as
> writes to decoded picture buffers, on 0x2a07. No SMR matches that
> stream, so the SMMU raises an unidentified stream fault, which TZ
> treats as fatal and resets the SoC:
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

