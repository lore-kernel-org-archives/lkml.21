Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612716;
	b=fVFzB9VlI2e8CLaaDcx/Qn6NO/gQdXcZwx9ZOBkNQtx6fsmUcpdI8vGZQwG5wwHRHqZk
	 EgLAETuRoBgpp+Kz0M9KIzkzkBaLm7d94Id0HbyRR2lHuiC4eiF33JXM/15eXyu5YV604
	 u5alRcaL1wjT9t4KJBGlU+frp0fmq2TvRihlrIpY+B53Rx6R3NkcqYttAL4Z3ZBoaWQba
	 RE+PfSz7Q1VoWPJ1iRXr3TMS9ZqNB5BALuhCMO4ztj+wnVZM7kKffPQ3uMkf6W7cpaxLF
	 VpsMijwikF9wGB3ktrZwnlx7kzJ006Lvy78PA/W0bcxOXjBSnUc/v/5iB7+6Sk+c0Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
	b=o3TZrHYttN6+VAKy0ZkwhwqItYIgq0iARga/wo29JQpZZ6x9dNEnIrBsPesg1cm1zAX9
	 fLAEhEnmDRFqBQx5zALAq6ob22bAflUugvFxcRgbFxWx2pGlnKMHeEYe6qXlAtHkYYmj5
	 eX9dP+EKqwLPJGnby/WwuDfy59oZJomrW7gT5muEz7b3aQrJf2GJd8KKrskxG9s9Mpdme
	 r2PQHjPwPT0f/z3mg+HmWwbL1Wvlnne9aSqc0wYAoYUtXJhsxnxHnrpfkLUB2kswx/8TQ
	 N8PLTpo14cIcGhlX+ipl4TF4qPp2GX5CItE6gq5OdHPVzC+t3tIk9djWwr0ykUOBVOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Znj8bc5r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF1606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADF1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Znj8bc5r
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8pA4130788
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4
	vVjC8WUg=; b=iFMdSavSoklC8ZWJzQs3vecWrTqmuWKu3WWcfvYnOuo9Ehf2OcR
	gSyIZ7aNh9JrBsYngVKO6Cr2ZFU5uoUW64X1TpHqbbVbOU4IBHckTNIrCBjj9xAq
	QoK3K4Q6jUyNHuWvDT1/3A4XhHy+LeSeya3MlsTzxpu9dWT32UNHZ/B2yEVQ1Gdy
	iOhOpmYdki1tf1tQJbcKdXJEqSlSsk33AZtNu0gjjkxPCyByT+dVA9ahbyCvGitS
	U/zwzC8C6CqtGhK04GVXYuDTv/evPkqQdZLNGFOwPFzAde0KKgcX+MxASapRpnA1
	u7+6fjbsBELWfBw0xojIfeE4pVBT2sSzKEQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs0jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece5510b79so3884969e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612713; x=1796217513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=Znj8bc5rqkJiAEyy9pcfiTZYR2qqCXeGth4D6jlHtPpine7o8u6mMCzvvoh5+mL04p
         FUxVk4e3xzYjhjk+hwoILqGRcO1g43m0Q+PvlW7wu5O1j4HgoSEiWp+BO30Gcj3KTA84
         Ik5JwqBxBGdDUrN3Z9xl8hcSyq3KB61mi0uMJaKznt4OzSkKTxyo7o9FFIVsq5s9jm5W
         wGh/VDc0kXNj6mlUNeap2gLt97a/xFOULz13okjF1Z2xrtNoD/B0PTSGndvOu0peuAKl
         uqoU0eE98PPmbn8ixIfrV2vKYCotGeBThNoUo27rmBl7Snx+E0Mu/pCE+tXRyfkA90ry
         K9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612713; x=1796217513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=Q+qLEVTFcFMtEA7nvVool9S3gLKS1bigDTVXNpsEbrg5d1P81uf8tGN94YU19oG271
         Q773cKpHJgXbGRAayRtywG2KT6HkpLtAxvjm7XNX5g3qMmUIr2H/sINuvsf2ys4jp9nq
         G9mpg3giellrSIxP9LDRZfQB9tcnkisOjSzWGTPBkLyuryF6pPyU5cmtoPeU24L5f1tO
         Itg2uYDInD9/sbW+aevDlxzwGNPBr+gNe60H/rALHgJjZrLGgmwbzMEgUd9Zl3td+Ett
         UtjShgAsyMyK7wbJospvWNH+yWW7vU1k0DxDAf0hPIglqGMDwfhkefSOzj4HhAMa7rN6
         jV0Q==
X-Forwarded-Encrypted: i=1; AL+hErHsnYGXsBZ8p09Il8OSighHNWef5buEcbW55Osreht8VwUJC0lJg76AYUF4NKj58eRjJ0G/TNiXdWDIA0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vPYQHnveKwOeGHvj5xLXQpHjiB4rhx4d9X7IhZJlbNiwtJaXK
	ifY915/psVak4lC8hPKnjAiQSvJWOJZ3pmFWVfPrVFzJkrJT5pnHmlOjySgEPY6eXqQzJHzW/17
	J9Tt/lVZidHgIioR5KRDi6RBu1gVqflRkwfXDqTLCQLLgag5ZvbGqZJq8f0NZ1HvFn5E=
X-Gm-Gg: AZFdTZdUNXEKDFV0JNxlcKFsa0nKKpTeCIur3uEd9bfj6pM10V26+7bS4OyJVHpsqXk
	7RvBtD2PSuom34w51thI+53fwsgl9vVI6tXArTQIffDTmWyAeDXfmezz8M7c4aODCsvai07WAYy
	0k0eT8QWzaxF54oAobQugDuPLsEWjqA5WaslckJxkHlPiXwvJ4SPWlaZouPCX/3VA6RUDahjiTw
	V7TyrGJd0Cgo/Of91cL9U1pB8Hlix28sGy6rCfhKpjdA5ADxLGp3iKtmiDnEQXgkEMHYSOt6pUI
	pDMQT0rgC3Z58aMZxcy9YOaT3h0vON3Z1sG0SFjuOtLdH0iy1QF6F5s6tpb3kLqcBUX3hfsCyFn
	IR71EbJSHgpVim4YcHdsoyp70vbYo1HEyYbBzG8LNfsd4z5a0+cLEUMhMSjYMk9Si
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9899561e0c.23.1795612707446;
        Wed, 25 Nov 2026 05:18:27 -0800 (PST)
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9898738e0c.23.1795612696151;
        Wed, 25 Nov 2026 05:18:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Wed, 25 Nov 2026 13:17:53 +0000
Message-ID: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e029 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tj6v_WFbzlxhzRuvkX0A:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: UIUhWeZSyQ0i3v2pS37z7RmqwCiArdbR
X-Proofpoint-ORIG-GUID: UIUhWeZSyQ0i3v2pS37z7RmqwCiArdbR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX7aPSWRubJktL
 ON4VKTyAzDY5M+4rZ3gYbJ7NIE/O+uFXx1rsAvQfG6ZKVvVRZQBaqyOUryav/MbWWYH8nlmAkNK
 lKXGEFW6ywsCGS3tot7Dks6IcxUrgjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXyDBJ3Rapo9w0
 q3/A//dZLSPwn6WbDchyq2IraXJFQ15jM8z5gopM0DhQhUOzNuipzD+H5f5XYpYeLkVqnRN8ed5
 xwOFvWIenNKBJq0O35XulhxRwelZzyiQ0pmLvhzEvDivqjpmXGCgBhqzW82PdZJHl6NsTzKyRES
 iuNkMJAYK37QuuEcY+ixDvmC4xZ1d0mA92rpMpwlBu81nJFWZ4go1wckrH+9pjDPqZ3+RzF2m2g
 4NZBm8Mdoytck5Be4/grauAmpEKnA1vN7yDHhNbRunveC3cso/yUthBQvwTqo6fyuEzC4O8hUGM
 CZo1N6vqqIMwmeKyDZshIeENl0UH6o6ZhVPGqMp9kmssDCVVPuGA1Vz9rycgomCbyh1Y1LwiVrs
 4wnE2Qtv/N+aTCGYOv0MjFrKHiOYTrumes66O3Fb4nW5MA2NbF1bDo9gilJz6+XFhenhgAhSQGA
 yog48BqPoOAVHZ+A36Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

This series adds the two LPASS clock controllers found on Glymur:
LPASS AUDIOCC (SoundWire RX and WSA1..4 resets) and LPASSCC (the TX
SoundWire reset). Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

The programming model is a near-exact match for the existing SC8280XP
controllers, so patches 1 and 2 extend qcom,sc8280xp-lpasscc.yaml with
the two Glymur compatibles instead of creating a new YAML file (per
Krzysztof's v1 review).

Changes in v4:
- 1/4, 2/4: add "qcom:" to the subject (Rob).
- 1/4: pick up Reviewed-by from Rob.
- 2/4: pick up Acked-by from Rob.

Changes in v3:
- 1/4, 2/4: extend the existing qcom,sc8280xp-lpasscc.yaml with the
            Glymur compatibles rather than adding a new YAML file;
            drop qcom,glymur-lpasscc.yaml; update title / description
            / See-also (Krzysztof, v1).
- 3/4: bump max_register to 0x3020 to cover the WSA3 / WSA4 reset
       offsets at 0x300c / 0x301c (Konrad, sashiko-bot).
- 3/4, 4/4: pick up Reviewed-by from Taniya and Konrad.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya).
- 3/4, 4/4: pick up Reviewed-by from Abel.

v3: https://lore.kernel.org/all/20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com
v2: https://lore.kernel.org/all/20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (4):
  dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for
    Glymur
  dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml |  7 +-
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
-- 
2.53.0

