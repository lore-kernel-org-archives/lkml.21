Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178823;
	b=punhi9ZRC8XJ3N9R/SfZjI2y/BaF98/osk+vvOVhB2pAjGrWNI/Z1BqKToG2IRd9xUnR
	 JtJsyEwBautBJfiITWAtGXlC2Ta4hqkkiya/vSngU6OE85pqC4bzwV3+FMpu17dcny3Yv
	 8gWmoEEk7T+qm7N0zVbDPBSrESfY3Z6rT+b7Cj8ZI6oVVFRiRgwhQLhbO5uRwYDtc2h/7
	 6q/zrPFuPJjVaLahxfwnqcJbdz6WYWkTiBLKqKF623XzCPd3PeAIvSAsbeAGd+pM4IFOR
	 ljqFKtE44sksW+nbgUh2pvZr1nIEAUid4t+vZcYl0WjW/8xVZ6w1CeGBN2BxzKcfFwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=fmgE31i74PRoiBxbwq6rtmvStgphVAXqnSzRETqSjqdvrpFRwQMgozlifnE6kNN+763Q
	 GnFk6LZ59OZ08v1/rqomHR7YC3kKdfkvpe6f68XBWzfXv2lc2pts3lJWUnOgMNAmflLvM
	 9E8gBi2zaiFePTawac2UJv49JwkJdt6E+faJ6lRmEu6JdH+QDii4OBN0Z+sQsIJRvZ3O4
	 +Z1DFyyjJHFz/QacxfT3vj+qeEQ9rdioSxQxS+L4CqnQ7p2MoZnG/X+vZtEa6AvnHfUwn
	 oJIrYAiOkiI09JTgSiL9jAgsFd1MyD68IKm4iixtdJdz8B912EWnGnMbSbm1R7LJJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKv4z6hh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB860A2625
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCB860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKv4z6hh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk5c5556702
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=UAMwMCcLhoJbJH+W
	5sN1nAYUCQGlFgvr/j15NPQLoqHS8MDQD3TNrbeZvD7We2T0ry/M6uRhu7MeP5Yb
	Vm/b9jVPoe1TTDZpJ4QsWexMTH+RpJHj1Vr7QUld74gZgxxZJEOFE4kjlFZ7meX8
	X8Qc+vzeWqRSXyGcC8CmIecSLkGx15Oym0RdICfwBDGPzbo0jPD8aLpfY3/AQcUO
	pH4kVuw/N9aFZ6bO1CZGkLHjAPP3F8ESP0hHCXX8TnCyH6k3Nhs6HDadABgo9QhA
	LshlcNIOcLXxnmFq49UVNBP2e95DN3lw1T22XpYIgZztX51I4X3cn+pDGxKiei/E
	Qz/w3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhu50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920f97bcad4so17700456d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178821; x=1795783621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=UKv4z6hha8uj9jVl+hxcbf8sveG8t4VR72npAGlKoxbRApYc0pS1BJKJx/O2N5wU0M
         R3/9AhdhOiGGugH6O9/lYtTXSq1tlVrIx7NxPApysPek+uQWL/AHSw6BrywgEMOXJs4Z
         mubeXX8gOHyBwZjHUhLV7Udmyqet5i8iUaBwqs6P237asl+AyF+xLNdlum4a6b7ieHne
         9yji+MeOXU4xDnMHFp8mJ33dqb1qFpwatOPGzAdEhjbAonFj0ak/697f9Li1OzFrQuzl
         WkmbbzpUerlktF99sp+ghrA7j9kHb3Ai2IaATnX320RtRtO+sCJEZprDwJ1zxs9FQUZc
         U87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178821; x=1795783621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=wpKB8gk9kagqJwIF9vLERfBpGbdxqCEbjfvnO3e6X2jIPtVpu3qlhHBczZy4Hh/KKC
         QkoL2FveXQV5CGpckje8Z3H/WxmisNtPy+Lt/GgAL4wFx6huDc/jXoEkitHmLYyg3Vkz
         OvKRTZuNQcDZEMujZwJuT6tkq/5gzjhU5tYuSml96BxFp9YsI1cWv9nnNo/yRcGz9Piu
         wMz+l9+dp4kZn+c4XobazO+zJLshZfdwcht1mqWZFp440kuztl6YOHD7wFkoQpqSwsNP
         igUK/+u9nkpVz01MExfNXfolYtlq60fCZk45/PoZcVIy/sXAu+syLyDTcVsbkZHjh1On
         hFKA==
X-Forwarded-Encrypted: i=1; AL+hErGuleHUTwpjq8qfSGhazfsbHx0C6i/JthH9kaqDYUzXG4I4O8hzouZITnZ8eEr15TzRoRoIPmNtnztRmXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z900Y8fCcNttN09fE4u/etrsr3R8LwHvCsBslLhR7ef7l8C7joE
	pMwWfpSc4tmawvChRC4tkl1WUTSrU4+gmxYd6kQdTHqAjJk0bkhYmTe+msxF8pwGnzSYlHtqjxZ
	OxCPfqvTJEWdlt9NL6YN4hwoG+SVIoIuq2sv/eb7oRz1rKNXqqsimCQBfT3mR0w++RT8=
X-Gm-Gg: AYBFou33rr4WydWF1RwE05JEFNN2r6z/J7SguL5qAtcBlGhHnifF0lIkgLuAsBX2Bkv
	MKcyOIkCEpBRT37+2F4T/7YgpnDhCeHsmIHN3AoK3JIgLJ7dP3XY5hktEG4Yiyc4IXvfKSOaUe2
	KHjBvJYGEGSvGMrFGE14juxszHTic7uqSlublA2MSKS1XxQWR/CNS4uVERxXAOhushevhRH9dWC
	wGVg7diJfmIIMxjP70dzqLd477ywXjCXf+RginNmTkb8jZsidk7vV8aS2xn5x0smL94f3foIN3s
	w/8Y0rgXe6vk+ntF3Yt17LFK3s5Ua/w5GIpETJt2ZuG804I37cKNu45RqoWvxLLZm6p+a55P0gu
	tOE5mQRdsda1XKcyp0ksmJoTrO+8uFbKCqeC0ATLIIUNJlNAMIi+EUAulK/+xL78D3CiXqWRXm9
	M=
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449852585a.35.1795178820792;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449847485a.35.1795178820256;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:41 +0100
Subject: [PATCH v3 04/10] device property: provide
 fwnode_property_get_names()
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
Message-Id: <20261120-fwnode-for-each-prop-v3-4-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3PDjq9bQKPjkTMTdlUm3r6EuwNZgwKcvA6
 jSm1HIhu72JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6y4D/kB0ChgwLoHAxKfuVspn2U6iejfyGbyMWeKeXaxbHy0Si/yLGe0wKT5QwN4Fd3leA4UbK5
 MzyqKqV4Z8YdcmhaEP5nJKGIEId4tG2SorN0mZC+L44P3RgDqOVvFy7OGF5kv63XLTBgT/42M4T
 wq4479LNWVbjCFK5k7ZoNOReyenKeA8Iyp3iwMtRmK0DLf+rXjK9CR5YG7kzSvqUtwUQNj8VP7t
 jk80UsnzeP55CP4KNqtBWPcx6AXKlZ0sJFR1Gfgp3h3WGKNVCAurA7BNKsd9YaUw0/JgQdPpxIr
 Q9kV+/akEb6/mwSwNf+0IwZrahSLTJKlMIYzDgqMkyW0xnEoES+9qwZjsaNNXFNv144Hqce1RYw
 A2iOH9Ao7UKBFvmrmvEZ5X8wSmFrcOJ/TaiCJ2LgyhfFvqIL5QBnEtYbfSA0uv3+ayqpX0iYx3x
 uByB+nGi+lL2ZmJAFHwk14fYruBd0Ly1I+eGCsUvP2Po8biW5AI6Gep37pFDo4DrW4BFfm3LfmS
 FMAiTUn4/EAG9eXYB0+22s8UDaCDMMwYKsblP0xsxyztls/mG+nJ4fi6Wp3v6RxGqrbEIEVlemF
 NtgAOsZ7sNPUZIjCfVWEWlzBLvNrsrEBGgZWs5JAO6dBP+6//F4UZstmM/S1VFeAWPQR7Rm8gmx
 1Ect461AWSQAECw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXznGd7hsKISF/
 okEX3kByMXq+BGt55GqO39MYMZcqThI4qO84FIhOB56RIzDa+kqrG0fulplyc+56xPXNen6VoGa
 xu8ynExJO8u6OPhDG00uNcDXZVFTjGlfD2PqSGPnK7V475CpLe2Vyi3SB7TyM7sh/NylvLNyE3M
 FuMXhvFeesXA429ekKHK9OSMESOnfP4KxqBjF1B13mYIrHA3m62KBJ3Q2Qeq4SucPtQVJCR6xQc
 uF1csIFFk2IjIRUlaX/ipv+/fYn9/ZU7fbi5uAXdaZvJ5FlReMmTV3PGJ80OqJOU1SHZzcsbzo3
 6haZP8uGBm2KK71JarYM6jgQ+NsRjWLoWKbOrwUcxBrtBd2LI18SKx6RPmKJq1JyzZe3spi01Ty
 c9JNlLVlQ4R6glXp1fc+L3SJnPirY0Sv+7tHxW9IUX0/h7S1heFU1WpiS98KQi+RanYjXVNB5dY
 OaQO/Tk7P8MAjDhDlNg==
X-Proofpoint-GUID: d-oJwESz0Jp8z63lwDdLFA6oCVwF-CuU
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004145 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: d-oJwESz0Jp8z63lwDdLFA6oCVwF-CuU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXx6PrFnaWjB9l
 eXcKNShrYb/64xtzrhmJqhgjMqpwAEkyQ24XrnRj7dLLCK+FUMtbH1RKK1yEM1uQ67bjQw4PT5s
 WNYXZjqejXbmEkLmbqZyTumwRM0kFk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 80 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7728116e296872b7ea4d4475aee72d95edf63eb6..d3c54c3d11c42ba4aef68687fc27291c7f33beb6 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,82 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names. Must not be NULL.
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once with the ones from the
+ * primary node taking precedence.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). If the node contains no
+ *	   properties or an error occurred, *props is left untouched.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode) || !props)
+		return -EINVAL;
+
+	ret1 = fwnode_call_int_op(fwnode, property_get_names, &prim);
+	if (!IS_ERR_OR_NULL(fwnode->secondary))
+		ret2 = fwnode_call_int_op(fwnode->secondary, property_get_names, &sec);
+
+	if (ret1 == -ENXIO && ret2 == -ENXIO)
+		return -ENXIO;
+
+	n1 = max(ret1, 0);
+	n2 = max(ret2, 0);
+
+	CLASS(strarray, prim_props)(prim, n1);
+	CLASS(strarray, sec_props)(sec, n2);
+
+	if (ret1 < 0 && ret1 != -ENXIO)
+		return ret1;
+
+	if (ret2 < 0 && ret2 != -ENXIO)
+		return ret2;
+
+	if (n1 == 0 && n2 == 0)
+		return 0;
+
+	merged = kcalloc(size_add(n1, n2), sizeof(*merged), GFP_KERNEL);
+	if (!merged)
+		return -ENOMEM;
+
+	/* The strings are now owned by merged, only free the container. */
+	for (i = 0; i < n1; i++) {
+		merged[i] = prim_props.array[i];
+		prim_props.array[i] = NULL;
+	}
+	count = n1;
+
+	/* Properties from the primary node take precedence. */
+	for (i = 0; i < n2; i++) {
+		for (j = 0; j < n1; j++) {
+			if (!strcmp(merged[j], sec_props.array[i]))
+				break;
+		}
+
+		if (j >= n1) {
+			merged[count++] = sec_props.array[i];
+			sec_props.array[i] = NULL;
+		}
+	}
+
+	*props = merged;
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_get_names);
+
 /**
  * fwnode_property_match_property_string - find a property string value in an array and return index
  * @fwnode: Firmware node to get the property of
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..a70f3c4c087dd85390951da950c3632f89c6cfd1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -77,6 +77,7 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 

-- 
2.47.3

