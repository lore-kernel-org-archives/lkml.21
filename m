Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685807;
	b=nHyFQvt0hCaqf4whlDjLvbIDHQwe5LsHaU936WHm50jZoyq1E0UMq3zPQ/bZMXA+lvwV
	 elrYKfRlsLw7POU5bp2qNi9M43HeAxExt8be5GJrKTKvkG8Opb0mnkLZ4l//t9B7ky4uE
	 FHM+JTzE5TLhETU0d9qvXotgNt0CrV/vW86ZC2gWXn0oz6YWCnd1zCwN/OgdcNZe8pn+E
	 DF28A2zss+utbNrGq8K+jv6F4ewstcGmo7886YfQ/DQJBKR9OIwhENVMwI+5hgfEcbYB1
	 L0xSmpXvTKxGQgXv755iDEO4OwD/iO5Z/wyzsDJ8zicvXogUVtdvjBgtUENF6H2SBlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
	b=K8Lm/Z2AgiNLgyFH/vJor95q2c3G5N+iiD6Yw6AKH9oJ3g/pzABipFzDVaIXnDu410zf
	 tPVq1F/j8wzixDKsaNPLTKO1ULhTKQwGfy77Kisw8p1cC+mRnG+W2bz4Wz2hmif3hsB1f
	 xnGMA7xdB0f++62Pqql90BcppJzKHQbAyCN8cAGafAktoR8mrCTBJntVVPbLfw8qf9UMD
	 hnXhD7IIl/4HjaLqMdwWctNl8h8eMc4C006jYI0sIXm786Ac8YkjU4DaI1H/xupYgX4GK
	 kylAjYjkCNzhv4HH6U0+Yikfy8EWhC6M01/SYHK4r0zKzV1XwwJd25nT6sWV2mDgU5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/FgWoyG";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A2606A6BA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8A2606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/FgWoyG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B6W13548371
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=; b=h+cGlcuMzvNibvmv
	CuHu4uSUESnjyED14sZPNgcLzWrSwYbOeaRBTH2HxXQ7ThH5SSfjUl3NHMt1THy4
	AakRTV6o/oXRwMHZo6UoqrH7lo9aoNCPQKgXieTCjhEQm048VEov1WJ1mkd8juAx
	IvVYoQrYXKatMHvWHYyGipGhl/qxAbziRaQwuTD/0zLsyxX2PkZ9whnbsIMttkxJ
	ZkwqMfHp59xDiVcPYGO6EmJVGTjJihYsiTfXO3gb7ZUq8B4WgpBIbclGcAIKzRN5
	4mq1Bre+aRNASOUKwM9OFGHDma4dz8vcMy5qqo3qrDtNv513uSvBU+YGkvn7fd7s
	8vVwcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauafs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so1027557785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685806; x=1796290606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=A/FgWoyGVmzPv87M5x+mlGi1B9+9nnU3WtAtnA+R7+8fHB92rj9pg2zaRBINLO9Nfr
         0LSO6MrksUM4T+kZCclwx3udpHwnunzIYsFukayMOGWXx4B5D7y/asHNRyBGwWHjJCCS
         CqUJa68MSMJciNbDRZaAHm2/SJVYVxfMihohfBOOvrw11fvD2RsBv8tA/l3j3bNZfSjM
         Cr6T++kZyc73J7FxmEI01XCyoz1Yib/hP01Xb0OZG/fMa3X+B7LuxGniS0UMi6n6PViw
         Ga/f+2xbyAdHbe0pUivGCIOX+FZB/zGy3jonMeBukJigrmhp9nCC8ivDMI/J+hBgPx1U
         o7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685806; x=1796290606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=txpoiiO3IfLsDWEjTkMjIDf8iZkTKhAo176l7y3g4MycrnovqXeVBpJwij4hV7b6pJ
         Lvz2bZQlrf6Ae8JYe/KMIqqaRcSobslCTUv399pQAmRJaR9JnjMh0BB7yRPQ7y9iT730
         RwgRt2Mj8hmRX4jpUlNjLbFkcnAs22ivRATBjUTcTPd2eHnZq1em+/6WBfA1QTUWuq7o
         O0Q59goS+xm7MxqcrY5EAQ+edc77c8qzy1nAmNgzYKfBoFXRbJ0Yzm/X6pNtwq9WGF9B
         Aij4+Ves5n5C6curwrYLG+Ob+BCnjdK9JZO0GsPj3QeFJznLyM6jgPMGcEBmsno9OLBM
         vwcg==
X-Forwarded-Encrypted: i=1; AL+hErE5MM3v9aWxRraPfqoXJ5TaasymUK9uCti3jsa+DrIyzcWWy0dTO5M5Nw2/5glC2YhFfVtJN7NE61C1jqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HxtgJeVjxECv7rpRE1gnGiYU3BSLSSLnMK1Sn/vmC/9fgf40h
	AieGb3Mslfbxa46SPp60aBjWlOinbqPE/cni951jpbmYfPlmb5GoV3dlynTZkcd71IvF0lB61fl
	GNMY7cUpdclw+0BaOzXPrVoUq2LhHc76h2rXrhEyKvdFQogDvMRBW7XrTxaEbV9Gg0Dk=
X-Gm-Gg: AZFdTZcl3vkraVj5PGIqrF4DvFVEW34wlv3F4Av85a4Zg7K5QLiQ6BcesSC/V+UhCJ/
	Tce6c7nrHdzap5+APVmdoe2MiLE5aojdMPkLgqSM4MlePza4pcH33uq+X9FDUT/dM0xIiNEyk9U
	CyfjXGM5JpShCKW51nJUZSWSCL1437hXfTpc4jwdShYzxjQTfzcaVz1apekaDvZ0uWcGvOmLdbE
	ift8WLb+pUi0654fkx2Gfz/B2IjNkzNGSrFa2zP4QYFiwQ7GnygC+vVIxK75O9hoaXg0TrxCh/r
	2vYJ4aqLMXkF2fHACtmITyCEmoIZQXSEibzJTcNj+YgjGA0OL7CHxHIX8IhFgATIQ42lxVzb1D3
	Pa/1OQLWoFM7wxbIxwsj2N/N/We2KwXJ/JgVGxMpQI/+/9maRtPbDnuJD8k3UCfBxuaZglo7p5C
	5tHQ==
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401667985a.57.1795685805634;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401665385a.57.1795685805201;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:26 +0100
Subject: [PATCH v4 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261126-fwnode-for-each-prop-v4-9-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gyj/ChOHQ3GV+pAQrZI7Aj+LCmcubDcyu6k27uxVWmY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2VBGjpdW0iPoYV/IBOQcKz/c99bTgMGWmFJ
 hPaWhBDSTmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lQAKCRAFnS7L/zaE
 w2dLD/46O+avWuwJk9Y4HHE4uUZvv4Qhzk8ofwZbheAvceHO9A5+8+hnMqT1GPcjC1Ghe102OWL
 V6NrN8dfJ2N0wHI2zFaidHgJyPqMmuAMYPU6HpmXKugkvfYQGzOINhEwhrraBKJ2q8FJiCUpnaO
 xG9OsMATlw6jAkNHEWsMQdy8l2GP2rOcF5JrH6pKG3qgQwwv6yvU6cqGSnZqQdSjMRRRLZdaE+D
 e4zHr1OIn7dlMfISNCDVdTvFcvKfid89g3gKEuWf5SSGHai7RN3O2U/5LdD0cV+bsJK+lYTVj/u
 D/KUol5Ewc2vjstIWNY5PXxy+9d9vKfh3GVoCLpY5/Jr8QYZhq4siS7vjntc2GiJqX/S7izKu/b
 A4pVua45kTJPSWaXgUWmAziQRD9/pdOJ5MovSbbEKffL7+ECKyjLkyG0rPOQvMnLIaFpgzZlVnc
 AwP2Y4ssqWvQckzOGNuH5AK6LNzfnxI/NRN21fClpVInQHCd0q7rlsrOhCs1I+rdJ7N2PbsjD/P
 Z74VTIWGnZDHQFuJTEw1FzCNfHSu2kEHZLXty7vFOfxFHhtR+o5hBJv4hNYTJ+D9i1YDqCtesR7
 5a7mgaefuiaasCNWIZSdTgy/wWJbyeEMJ36vwc9q0HqEQYcuFbw1lXeNJ7608GR4+5gdwzdSf5l
 n08uKr14tH+EAdQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX/3W6CJiCqFb2
 ctktXB3lfEhz/4nIS/GJZTab9WXxP9I5eUyDj0DDvJuNFom/m48J1MeoZVm+I8HuOJ9OCeu7Amw
 6Ft1E4N4HOtE6p3Lb6gVIhigC/xaW9o=
X-Proofpoint-ORIG-GUID: pe3Y7KFMV-4WtACD3Sgf9Bk7pQ9gHGxG
X-Proofpoint-GUID: pe3Y7KFMV-4WtACD3Sgf9Bk7pQ9gHGxG
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fdae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXxJDHTifmqgyk
 RVWpuNGhmxhEpvwEkO1p8OH4kutPuBtY/pmRZZ6SgJfAbRvJis3LdV3Qbh7I602dG3ST8Aqe1n5
 bNtnZupB5rHKV3VpN5qMk9ZOVQ132vWyEVGs1mFC26JlBIQE7bKqmKBQd2RQs+gZS9a6DdTKWfS
 eiEFNamhWgABhbcBwaiB+qiuZYYoiNW5VGF5j0CJz/1ZY2SW5VajUTBaWG529lpeASMPL4a+g8z
 c3vYjZJqPch857L441D/WH/RHHy5BA9dKvUuQbeMHMBVcJxs0OZKNTgzNjy8Bulz1FV0lx/QUZc
 vXpHPJnaOeJ8Hc0IASgbQ25zKe/vv0I0WXkuAq3a5oj3ayYQmMWSIsBKCGV72UQ/5+FNHJOKE7s
 MW4Wm00iJDJnT/EzI/lrrZeVJmi8Bf1rZJKRZio8hx6Tik8u5Sc0iwk8DZpXuShQSz/ylu4Iwsw
 g1D3wFtNwcgngn6N7NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 7f8b31ce4b9ecdff8cb8e34bdd546f44a21d9ed9..610d4b35d37c512eba6e8feab58dca2d9da0a152 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

