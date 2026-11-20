Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178816;
	b=ekBamCSjeoUz+o5t2ognbp0Eua1NgpFCC95fcw42T+/AR3bXujpzuKuUMnEWt6M3GvF7
	 Yt28Sa4gqYnEdvWfFxDAiOX0DPO/PZKZfeaAJkQ6wL+/dTi63ov5bWeXFbvM0YXPs08vs
	 pNPgu6pSbGBP08Cr8IKPadnmYXDoNHbN7zZ9V/fN2AdEtJ7it6gyqDinrczq4e79TxFVC
	 gKFh32NXEt20E7ffOpyUnrLYPtgTcqX+Ziv9No7i3xpQ4RMJoxBHOejiHhRjDoZFNdTz2
	 XwI5ERyZSlUhCnpl8I/V+4nYgKc6rkTGHLMTAC2GTJbrVqmDQN2erov71xZpcLb5x6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
	b=bmLuOJI0YIxclbJ3Li/ggTQi29DDjV+EdMX8ftsgIY/6Q3geFPi9AEmylEpWLcRpfpdo
	 Gva05VkfOeBz9U7eV5nXcfmEOe7QhOcfRe9Lt0XGaClWzOTbACIJuAmuZIgvaeOtT7f5U
	 vsmGapK8U9aU2xmNJK3I7IgHiIz95rRCnfxgPdCz5crnwVjCE6rVnHejNVakGBsMtYfSU
	 E5QvxlHSrxXVG9tNPUbIsRCyIojv6nNKtwfrNL8CPcY89oyxyl0IvOXoDiNAnQ7ss2BDs
	 U1osvifywRzHzjJXextICX6JgO/vkvjYmY9vyg8id2s3ksNrZoxuFq1WiFnaqZyI4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSzLGaS0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B260A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8B260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSzLGaS0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKC0Z0l1224315
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=; b=R0QGU5oFbZc24jaz
	K8JeAKp+DafQwKeQBoxLJHy9NZenThm3sYRNunrFmfHhNflJkG57Pc06Y0tXT3KB
	SqZxq+4s300d9D/djek7paTjIddyIBOvH+j4ldJnws3F0Dk0fC2OTq2fJ3CHsSHH
	BS2PivKuvPe/co8DBU0MghGe5/XjX6WZ0YFBb15T2mw2TWvuFKIsRZDZRYSMG8TN
	Q1tcme8/mDF6IGuHndSuVJaleqI2nkQ0ZWOmi4EzT9KR6kQcogvd9WhIS3t/KNWC
	YT7U6d4J6Aa6JrrGb1U/Pr4Hgk/duzmLevKcsBkat4fZdSNAoaYDya0g5kKZIXtn
	iXQTMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykqxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so97231885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178814; x=1795783614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=iSzLGaS0fMC2twSJZ6CHEvYwjXiIf0FMXWhLNiLgJ8Tbk+te1FE7nMPlqoZA0+zrFc
         Z0mMLMFfxF4W/FvqfOdar9BJPTyOK6/Ek3Wx/oSWHiIzWz3Arkd4E4xcm7jIcvhFH7VL
         L14v82dZ7Ag34vyMugl4pDsM+WvxUXeGFBLf3biCXkpXEq0U8pIOUYKv/6MdbA1OA1vY
         sMw9Qo1pJbp5f1xIxwA2JkUjG9DL+vfcBFKqUiEuWMO5cHx04PaFg/AGZnAwIGMAbjFn
         Z79U0Pm+NSpB3NMYHOYkeggFCm9O/d7c/BfP9WTSGDW4PVq9aJdCa82w2YqLOglqKbwc
         U0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178814; x=1795783614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=MX4l9WMdBCIeZqS9wHOLSEr08rchYRcEaI3B7CdPm10ZmC7skOk7i6tLdbdMUsidq1
         OhTpQxwKJsT88LIGmlWztX5nKzy5hKpFpdJuR0/XTXSfdJlEo9ohuO+TUGmGfKZjDiyB
         tPhyp6qM+zjTeRsMTaXymMjSwtpr17c38JZ7oKFp3yWhTonLqTAb5IPK9EkB3ssaTsK/
         Qn6sCOANbEN46O8YFyVvVEYPCzQjsL/51+Pcu/fJ0S31P8EUqrUuEITK5h3hvSVFRcfw
         LAWFuIaQubrIczSS85YdBEcpVAz4puLocEHl+vvgt9yypTdQCWUx6OKqQt5VRfEJDTFp
         3FKQ==
X-Forwarded-Encrypted: i=1; AL+hErGe7lTB9DqliOFdNNTiC6xY1fn6AV85di5r2HpiUymlYqyq96bqmVzvF16O95lcr2hfP3+E1hV2Y4zgncA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3H/Jq6ZOEdGFTJ//WBTb2PW1Jpq6qA7mY7kTX2yCn4YyTfyGD
	IsY78iNGwzwUKF69bKSaFvrnMaJNQZtUC5qLC0yIH5wqMKwwM1uR8+awUWPYPPFMPLJI003uyoM
	fIau6MyDhRX1O0RlTyqePYopm84LlKedFenNsqOc8Hsz+6g364zSYXjNH3qgd2Bv2lTw=
X-Gm-Gg: AYBFou3IjGedbZ6NAzmAf9cxw5kFfk0GvkrVNRvBzRywnVbmyliRlJbLfy1bGaVX+EC
	1CRKmOHFPEHHSBDZImQUdNiPL43rDZqpOqrdhxxgWuPBYlDD3+lt93Nake6HpYz0zPlAAaJ7bYb
	mWdJJihhJpmJCNvkL8ornzBWgDnNE+2DhM7ej00ij8JmUcfOmVnPHEqI5ZedAz6xpkTZNiJ9xOn
	AUneQ0hG1zDs3gOEI35IsXvmG/CfomyHeULl0n86dWTafH6x0cyWvilqwmrN9ZkWY6Ao77yyz3z
	M6YPPWF/jzfQEnr/OqpfZKua4+tMGX2YtVwqE1R0HjnpY9F+ZCp6477bXjqDmq07vTT9IVXfuFE
	iD6nB2Y49Wn3TxBGtTPLE9IuCi6ExDclzQSrk6+8m3xejMluX4LQCKfPJiIeKdVCND9+6z1Q2MZ
	M=
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519730985a.23.1795178813991;
        Fri, 20 Nov 2026 04:46:53 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519726085a.23.1795178813505;
        Fri, 20 Nov 2026 04:46:53 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:38 +0100
Subject: [PATCH v3 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261120-fwnode-for-each-prop-v3-1-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hYScHpsRvvGBrMd1w71TLaQh4T+I7gIpjdQzKJBQdf0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE29BUzYu7qXthMo1ziHpRFzdZUEh3WqC84F
 OGuKrX0zbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w34sD/9INMXQs1L2Mvsqvlku0UNIaFhS95oY+fgGh50hV8uPpZqYJ9NtZmpgskw0vpYis2Ro36u
 cztRSspCvn/1Jy3tnFXLHIbVPKIidV7uL/eo+pgDu2WooSCrpLxyVtDrCNZnyQY4rzglxSzgFmV
 20FtfdT647KzE+j63r3q2iadFYnTGomwGclZCfdpr3nExBli6ufhptbHBx2Q47EUvuQUGzvAV7k
 vyt4OFpD9PqxpFfoyXpBqT1Pgs9d8guOTsWXkbluTz0VOLA0sNtoMilnS0MvpxAe5azhLzRFSS7
 qrgJL5Vki0qb8jbx6YgCBxzPIf7Kmu6tQtg2hfjYCFsPj32pKplN7th3AJk8sj9qpLQIjomLZvw
 ZpTl8iJgw2H+oh6esb977jX6S5IxI7IiNqfg2zbHb308qdGmD7tw8z15idvvEDvyKO75tJHJ/79
 wkxPro8xFGpTImnweShdNOz9gkOVNue3adn56GhyY1nrWX3KyRYSzUskSGUEkAuFxpZkOAcMYWe
 SDGKXMcobp9/+IK83ILgxdB8ShLGcthKK1mx4mcAtYwMmbI3VBlmq2qBPyDJ8N6EyXkSnaNYB0i
 po/BVd4HrzPDYz4cPMbC/f4Ix9nHwFiCRJAYTkd89W28TI1EEtyp6D2bWlP3PDqIyCppC7jgWh/
 mWyRS+q1a+CyOKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX52NPvuS8Gi3L
 6jeJXQ0wB+dW8PAWZQ9wtV0Ww5vnT9h5XwYQ1Ok/yFRjUAoGBX3bQonY4s4WXHH4THfTPj0rU4P
 Zb9yoSlYfSU+3qs1xlx8KvtbNywzlJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXyHyV2rAFGkRX
 dvOfqE4MTNMFbojDFfPZVgM0gtAI+f6HlXG/MFNRb6pC8zeInAps3TQu19dhy1nSWGtP04PRwA/
 vgtzWiXXL9gLvMn5UOOO2eg616AiVZzscuYsHmBK/QRBrwlZGsu1UbW5k78ZjuQynAb3E5ssKbY
 KutPYFNkGWFaM9izUOze6rNnxUWyeWm2+96RZHGJMQjcT86C5b6MWV9KZRp99ZxgfEw9qUY9asF
 wtvSQ5DVTAU95IvcejJYHLrAxTsP02QyCHE6pt5dUvkKTYOzfd1m2eick5RwkD3vtMftjvUlQ+G
 z2J2xEWpX5pooUwQmptEesvZ1twYwSVqv+dTvzvXKDyySDi88tZPRnyKwjl58s5+DkQwI4VO7jH
 GV6OsHOxTcmBN6MfE02MU0BseiwUT+CCgvlu7vohK7FFBBvkq8ax/Yqm8F+z5vZhcmmH148st/0
 blVnUhNyU7EanCoo6Xw==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b00413e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DbrvYnOIqgfnN6RcRmhzF21iAYxBKl6M
X-Proofpoint-GUID: DbrvYnOIqgfnN6RcRmhzF21iAYxBKl6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

