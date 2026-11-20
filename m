Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178820;
	b=txOAv26AEdlrnW9BYtfHp0Bi+tujbq5naydKmtvUTqAdGZtg5jydsKsQYCOZ7AWJOeRf
	 yknFXzRlWCQ3uhRdABVQKe+Q80XmbZApDzKWGnOx5QDGhzXF8ExW4UHfucyHjab5uC0Sh
	 TsRx6IpMwMJUd/75OslmZ4VFWKs/HUz15CYmAzqLs/PBb7sABCGA5f9AVu/GhqLROHw+n
	 YdkkWm8kGcWbwS3HEIaH5Al66D2WBc7L5rj/91SNCt9L13qJNd+LCbtqbvs307BJYGc2n
	 YFYyMrZOb8Rs1ZjFsLPMJ/Nl3Cg2emNVnIkK7yd8NXn9q/4lq3H0c7sdX1C8uPOug3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=kRyw1Olqt3AwFasoH2utVIb35zNvG4F+8Dcc0KMIX1vega+z14JUx3IXnFQigtMZ7PeU
	 LvnHdEr64iNADJiTNQuBOZ5M7Xfu4NtCbHIqMgmYm3TSd2SLcLRedZUe4CMX1U08iGrtA
	 p4ZrpDvxA/fZ3JLldEN6PNfTBtef9d4m35OycgJgMM7Z44XYBvdc9Vb7JI0eVNkjtEIuC
	 Lc8wbmYWJp5m0pxfLWOOq3HZ8gnkQkfPiZPFQhh6qVphwYbyX3XG2tOwqZr8lb8Oar+Qi
	 4QPqUUeQZwYabVdnhy/Y0k8qDOFUP+D3nK+czgjgO8zNisTvxVeyWCZRY3HK+YIzLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B860A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7B860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkf6R3107607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=NjEZIDq9tn4Z2X5E
	0HaiSmEYxLZfR95m0e5mOAQrJ36D4UvFWOcUkPlkrAzmdt/SzrPUpH9YNvLqe+6/
	se5miVwDJmett3+70EUwKaCq8F88mLX+WFnVQQmwsmnUpTs5W27KVmO18hMKX2y0
	AuJsOqQMbXBUTBEtKr87UK1crqQkuYbw3tNl3Xu7FVmLGg0qTUAh8niOmNbXLCZk
	WsmYv5U2hFMbGOPUyAGYvNB5Cbj201pRjoPvQlrfAnc/PfFIbzGuskjCh7hrAy9V
	QL7z2J4ER0w02AkWPbiALFCC2e1wLQILLEpsBKRRV3kUWvVmGBHWCC4LMXB4W0p4
	Fwiq8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9212335e257so21149366d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178818; x=1795783618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=j+1ZjdQE0SlVRXDrtu/Kk0/nKZyNW5BxrPVte4tctk869ofzCViwwjPuAwFH+jeH10
         84nopc2bXBdUeb6rF+i3rthJBBXppFj/lXTfAJzN/Fyzq3Hx2mdDcn5zHQ2vg1Mjw3pt
         bl4LVm7Dfv7qtbwnhnH1JiB2PX+8Np4QnMzndAUGWRQ8uNWXX+qDggp9taJxsjc4i3jD
         V0hsmZoYhz5m1K+pkqA8TM87d5OHD6Y/kOOiF9lmbd6yIP9D+fvHlzuiqpjtAyosCi30
         q1IBG1cIndSY9PS3Q0IEVpw+euQpq1eE9f9D6cp49tbQIIg6z+QRAPLWLSXmyBgi3r9F
         +WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178818; x=1795783618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=NbUDaYoj1GBI/K8DKuzFmjyeU2n6CXr5n0tOnIRWh+V4Eb8EaxLqLMCtZSNhU6jF2e
         ZwKyyv+5MEtesnHOsuCH6DrSOI2msPzzm9aqqhLvD2nP/4G9ePGM/bsHS+L8SvIrJJoO
         9g+LzD+iemdkPAqcfvzWPp0tDbdgk9HRZoYxQYpqn8l//MolDHKvONbwkv9d14BgzjJj
         UPqXrfkl6CtRBuZ/bYHRBbZmnRAN0ZdjbhvVht8RAbE0Pj7XiVXoNubTijXThQ8NSh6Z
         umFi81PxsdOqFonPYyERXFJF8yAtyCiLlpW6xK9VGa2jUUW2rA2vpWNenRtnxWR+iq/Z
         VNLA==
X-Forwarded-Encrypted: i=1; AL+hErGklqV0l36y7IWXjWM9P71x325Cr87llxG03G6AxStuV0Tnler7SpRHYDw885DKP3phwWu9A5+v0j8k+5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8me7Ytav3qbygGDUH6XM+8AZBHhS9UBqSB3Io/TprseTHUcnY
	zWp5arY+4W0UJeoCia9uAs3Obi4oClk64ALOQMiMpZaLTK4KklKXSXZzRhNiMwl/qxJV4TeiPfq
	tShbsUovQojTzvb/OvlzHydRQPD0U+PaTYBIyFc7McUOd1wxU/Nsf1mungqNX6clNzxo=
X-Gm-Gg: AYBFou0YuJkmOzJAuVrIFbRML3jScRHIqqBpXPZ/cLFlG85LhHqL3eseHPOptdz+8M2
	tEGsdzkj4/SzblynhUrKs+PULufTcl/kjwiBXOck7gNoO9Dr1Gsu0vKzhxorDTmzAqLWxxc+9Yx
	4V1zrxUm/3+yWZetITIsapwXGLjgqIfjF9+FcwVAO20ZWlvHO3dm15zUU5gkRSXXD7NfaBkMGSh
	P332C71292405rYxIdfx7/F8K/k6ED6e4DapQmiAtK+5qcPCiP7dIFAEw1DwJpnGdGZCOruqLPA
	l1eifMz1Bti+7bCI6A/IieMObhetDH1yqLJWHfUUdBtf+w3859mmsfp28C1g84BTQg0s/VR334l
	YUvhJYcucxIfKwH4+AEPwvb13fNkRABdDojZF2sePTe+6AkxVSznrT8LN5LHm6OxqzLx2fj+dNj
	c=
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449538985a.30.1795178818327;
        Fri, 20 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449535485a.30.1795178817851;
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:40 +0100
Subject: [PATCH v3 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261120-fwnode-for-each-prop-v3-3-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2YIXomUiP9/eRkoyZzWQkqxyOPxkHquCjX
 15WcGRwohyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 wyGKD/0aFMoAZkgBZHdI4bxjsR6xspltaKVqqj8fM8pz5k5lJatsHR36nDle+C04E8L3ip3Rws9
 aVGD6HnZjtIDPLqidEbc5Mjax4aHWXq3WpwWO7oC/GRFsDdLYWkQLwbJWmIF3wWCIzIUJC4IrzK
 sOr22Rk+bFBM5DB5p1zXrrSfjdWeHukDbg7JOGPpi9DRSGRRLvAlm2zt9oTbGtSpYA0HQRmdYJN
 KdPC6OGSROSHYkJ6IuteD8y/j4Qi9O0SF+2Zqp7ijy3dHMsKByeV8J3fHXeeNVhZE9RJ5MYKDjE
 W7ViQJYpTz6o+HUXnAK3mXITMsu5SWQMJQB1P/cD4tDRmUuaMbUtesJ7ff1ht5lc7giXdx3zCkT
 Z/uA5X//2XRBWYlV5YuCUD0X5MUGXO0FtOLs3ampXNHoPxqHhegoAcFiK3Scpmm9/L/pHKm4tWq
 itpquAJ7pgNYIpN5Q2G+SS0gtYLNKirsTbuJ6YLJK1XbVR1xol1t2A+JQFRLVCZgYQHEbmPf/4O
 /f6puKDBmqsY53oJLUsXDOo9oB76eNaRY6PTSjf3zt6aXaOMpMUIC4dZKRUOxe6jFqnfroWbsCP
 xBtYg3V63MbfPFDKsCAD7o2rn5twVnaNU6UT3IgF/dRIhm97XwbMbcydQ1liHyxbxPSMMqVv8u9
 6hNsVEEpyC9oJLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX9rz+bz7Rkp3I
 J6YhfErkI3s40twYMGmR6C0CAQAvPINWRDXa/eN+7bEyOG6Q7xxbAfQyGeu/F5EnN1h4OuFdhk6
 /fG5SF5t7x+Oc7ynxyLcJ/xvX+bNXlNvkc3C4mFdsSvYe4oxxHyaPVsgEO+H1bAVJOSInea/yb7
 U5GfewBqD9v8u82qAx4nyiexx7MZQizUsxBGwSnOWP9qK39JqrDyWwC1rz5PlQeAScUALmePzNU
 BE6RWTYdjuUIRBuURvOWOFuio+npPlMfZEcm9FcJwrKK1EFBZZVlS0ylLu2ymNQX8RIrUAMuJJJ
 mEQssJJh6NI/DDx5sfDHS5hJdHFLrxhW23Ay4XxZaFbVI+rQ7E0qsv4260WM+z/vlgjKH/IjGHd
 0najKGEFSyZokQOzLuDnN5UrTnjXGGYNfZIqw7g+JDNspiHFpqcg6z2mJaPEj3xu2mlJOg0wWOI
 SDXDWZqMTc22m0kt+Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXxd7iE9TMOxma
 xN4ljT9N1ymt5mmwId93lapm9uJY0TXHw10+UQ/tjG2zPDumaU5B8zP9wmaG6BDnnkKrniMUTZs
 PAk2/tdkJ14Ope15UQtZbWdYcBaT4KQ=
X-Proofpoint-ORIG-GUID: T5Fe5LcnUdFJVE5BhkAIjmayzN7Ybtj-
X-Proofpoint-GUID: T5Fe5LcnUdFJVE5BhkAIjmayzN7Ybtj-
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004143 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

Define a new fwnode operation allowing to retrieve the list of all
properties of given firmware node in a dynamically allocated array of
strings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..2d7e0b9245d445d473c7317bd27058abe5750b40 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -125,6 +125,13 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_get_names: Retrieve the list of all properties of this firmware
+ *			node. On success: returns the number of properties and
+ *			sets *props to an array of NULL-terminated strings that
+ *			must be freed by the user with kfree_strarray(). If
+ *			there are no properties, 0 is returned and the props
+ *			pointer is not changed. Returns negative error number on
+ *			failure.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -162,6 +169,8 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_get_names)(const struct fwnode_handle *fwnode,
+				  char ***props);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);

-- 
2.47.3

