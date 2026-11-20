Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795181995;
	b=xMMqisgle6LTX/yWxpF5dlF7bgD2+zJLSO6ZUZFM6UHpVuAwix85ASOIyoEYfSXy6A3v
	 i38p0MvRunvfBrmQwa7OPkOsj9cUG/FEdCHDLPC2kpSYAz1WHxfFW58nFGraHNL0YxNyu
	 ys3mdfWR/uOshYFMrMuWSjPeXHPtFMwojUsZ7jlWsUhyzsYz0N6froLfh82Gik3lSk0Fw
	 DDteToRlK9tn/VCUPlZMnvyA8NwePEhqL9X15fPKE7/Zgz27ERMRx72FePjcm8W4OQb4a
	 gHEXZrl2dUJaJAcEK6SbZbNVwMr1JSX/sKzDku4p4rDwxCgikv3j+hdUCHOdb4ULi4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqMv/OV8MsEdJinmIa+2n6ss2Bycp38BjbJR4HiUnm8=;
	b=YFK01Rn53CDpdV9wM+WojiMmoEcKEUA33+BlB1qRT05W84CKDNOb1fqnqE5rQr90m1FN
	 8/PCKwULqPfcvsHMfiEtaPYNAR4NyAac7ZDAvxraw2c7093lWB5Qluzq3ImyRaLfpGDhp
	 8Ar/ccn7csv4Kytkh1R3pYl1PkZRwgyaqlcLJaQT/CBwAtPNNVlGP+kVFhzyOGywBOHwE
	 aPn/X7kDco+pfPpwrJ83l7gNoY4JdFV9DfW23Ec6Bai3DT24woN3kF6M3VVwnhCtGIEXs
	 ckB75bYsMJUczpIRHJIMn4Lh/EpSbBxFFpS5wXS4XX5KZWjqrwHWUJmLcLqhMSLMiyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ks+vR7iC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gH6eyv1Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54597606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54597606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ks+vR7iC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gH6eyv1Z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqXG1681897
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqMv/OV8MsEdJinmIa+2n6ss2Bycp38BjbJR4HiUnm8=; b=Ks+vR7iC0Clge7z8
	SvQ6m6iddv/cAiMHm5PvlZAwXCnYSHBBD9oXyLDBLyhgnrWlzBqvSlvZFSTF26n7
	IsSOcxGYyJ6an6d3PrTcZm/7aPWRsItbQdRhWC4cFU29gwSYLu20Ihh8W9LKP/nx
	79a4VC9fHjdBNMIFJ35mwZoyE0xkbB71sOdqeVCNcmmpx+GJqdTGjPqbcRVe4cqO
	AKrMMqW4P6c1C1jmuHO28JzzbYOtgLF4IPo5FcFsz1DbgzgWrK/RD2NKazv14qa7
	LefMfCi5D0uMoSb6lGxwOK6+WYGYy7ITeGWIAbys+Mib0dSDAf6lvn7xNk3YecjT
	E63yUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tpwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:39:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso169997685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795181993; cv=none;
        d=google.com; s=arc-20260327;
        b=ijB19PM0jsSFI3rvwi6TG7SP08W2XnghvzbqsP9aAmN9pXAsn31M9WjdbyfZjcKy51
         1Kq5roZHufr6FeuoIwhwvqmVpyzuT84vB4Iz6O91CuVAXguYvT3gdLkqKba1fcnGT5eQ
         df6Re/oyoquLFqF/rRHtzAKJxffIHX9ULIO6T+3lKwVYU4q7sQOJilmdTGx/xqhhtOpF
         oNYKtbpJsJ/2IVJ/A5gbVGI9Z8bURADz0mu4x+geyv7qhHb+FpAE2WLk6iNvWPAyHcLM
         VOcZRXiJHH+kbDsBKzUgYKS0blaSMe273YVlUgOXjgwi8bsEbYaHqvtuz9phmwhRL2zj
         EEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HqMv/OV8MsEdJinmIa+2n6ss2Bycp38BjbJR4HiUnm8=;
        fh=86/e6JEuq5ObRszGvWba65C4P62PmubGaD0dtEllCF4=;
        b=MnfV+tFFEZNvgdXj1t4ug9aiSGkZE74cJimWa/aRkXUPaWgVtg/ygSk450Eyj+gSir
         HlujGA+Fl14gVNz1ONWCBN2vVXCvM4pBF+qyYu4WZspmXz2Qq2zw/kreNKGgBpv66rv7
         Mv8ulw5wSh0dLsJ6qnEVVxHmqSJ7cg6FNDkSkDIEIBhULKddIKmBkaHVbl38JhALTpff
         SanK9dT2ppn+seNNVzkwqtfddwSgA0NgBY/5nUXWlNM7szMwcIFRUgNiomWogr8aBZbq
         dwpYoKSR+yf5/IjCLyOXJHQSW9ce1ur8FD44atQVFXT0RQAiAJFpMsZOuel9EJLtXZWD
         gS2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181993; x=1795786793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqMv/OV8MsEdJinmIa+2n6ss2Bycp38BjbJR4HiUnm8=;
        b=gH6eyv1ZC4qIyQO7+5eYFf2Ss01DCVVc8R4Wr45fkhie29q9Xki8R9BAmEQMR7uZ9h
         3odaNlmtRttWZjvz9Og369y7uPj3nv47hNLVtoieJAWmgN3cxxL1XH2tky2Z9xYqMtFz
         ORlx59ZcgR+A5l4YvlgIY4ux60RbFR/Q+3Oi/e1kdC98lWP3PkgtwZpoIgXmPb3jO5z6
         psH4CtKyf3JBjka9jiNFkwCB7RtgZXxX6GirWAH6iENnE7OdpkVUY7okQuC6zxkqR4H/
         xKdQ3pWq6avxltau/fa7v94GMh9mOfTOmQBuuGVkDzsM+AC6U46P7O0V6Ap4AHSbYzot
         NHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181993; x=1795786793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqMv/OV8MsEdJinmIa+2n6ss2Bycp38BjbJR4HiUnm8=;
        b=Yj1EY0RM4iWMw/fHpGQzOHX8wytLHo8QLprH5v/rUIts8hvOF2uq+XDcubiweFQyYP
         wL2ERgGOvXHmeEfuYwoekXH0JVqj5LtkAErcf2u/y1+IWyPmkIz9wlGEn5U2y/Krf0Hf
         dFRDnKZFCXylyIY+0OFZXJS8euoezt0s5uSgn4Dmx3QUP2lilpYWLvNn2uHJNMh2M2IR
         7bhc2mmFapXPljvRryoWVnS9Pu0BE658LJLHbHofpn3YNOd1lAd84aHqSE3JJEVclDbQ
         pDmoHtJX/B4s5cN2LUMys9uF6m9r1oDV0hDEtlBuctlojGqfz6tZyj98h0exgrk0zudI
         TmNQ==
X-Forwarded-Encrypted: i=1; AL+hErHkffKE9pvOLqz0RFoh4+fczabwNN4ug9/aP3yXZcUv+LqefRAmM2oeAzXvqNk7ksaHFuQHBJN/g74TozI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gp+5l7TZ7FnfvAPcrX9CjHk43AjZ8D4TKRZ30sZEgQ7Qiad1Q
	5z59vJJqfGLPvXTn7yU7Zfuc6cEg9TTZt3vn+6kr5OeZBg0E44S94DXDifWvfhhSHuphUWqduPo
	RJdHsKzlIGZcX2FWJfDOf1Tt+5gu9a5hbLgoSgJY4rn1sfXH/vtruiyOjwp47bRKtqInVpLMkak
	dVSDf6/u6aFR5v8+91AfOiX8LkwTpNwf/M0MX8T6ylaA==
X-Gm-Gg: AYBFou1AlM3c0EuwO7nb5jUk6xExfujJqPThBMd9EWCWrQZfkiAzG3SR1w/KSk+8b4P
	5pttOHuSLg/zop7mwuYbvQhkLV3Kft+DFMwt65T4RVgGAqgzhN64GPKEsyTECl1TZPV76SmoR9g
	AIDAO2P50eBRIiAVhMLtthGdposNpl+1lEnXcQmFEY3F5Xt5CARaiT8syOTkzh7+gCTTRKb8vHc
	cxwlk5Qy2+uVdkpKDWTL+98xt7qp7ZA+ezXft+W5bf7icocAd8Vq2UkHGYq61yPRLKLOL4XZUM=
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr483538485a.42.1795181993405;
        Fri, 20 Nov 2026 05:39:53 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id
 af79cd13be357-949ba9b4a76mr483533885a.42.1795181992773; Fri, 20 Nov 2026
 05:39:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120062048.40310-1-enderaoelyther@gmail.com>
In-Reply-To: <20261120062048.40310-1-enderaoelyther@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:39:41 +0100
X-Gm-Features: Aa3M54qlRjeHgSFR1P3wHaYy6O8vflIlT3vP_wsr0HOLoZAnrHp26MLwOWOnWts
Message-ID: <CAFEp6-37+O4BoSL414Njogr-34G7se-8Nu+O7B0zjBY1Jw7UWg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_serdev: stop write_work before closing
 the port
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael McAllister <me@michaelmcallister.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004daa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=gJp14KxlFVqSh94YCh0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6urdDfMaRN2qFo5WwKCHwaCt-gPitdkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX03YiurQSJiiH
 /gbS1pguRoixUdpSPgdXv3ird2/LTOpiafFxW5Fx1Q0yjHVgdlOtZIGy9An7a/8hGHlUOkl3ZGC
 u9rEX6vqK5py6HPxrrbIgIWCJjGD+DfKaQCT7l137CyD/7RMO1Tp6W1ECGGe9zxr9mRWPeVj78B
 TVRb5ZqwQaY9Hx9n7EMpiJpXRD+RFZcZcmKYFMzKzmKXglgB0pbwQcJ260V1M2GGhcCxdIy8jGd
 oRxqUXVVBWY9PowoLldGnANwrBPS1k1yAx0JAJr8gESfVkplMF5WjHdDmu19M7XlgLR73Y4lt5v
 qiSTpvkqVUUg6GY+DkHpr4bCeGz77ZReLfTgihrzWrvZcQgn34pFPxwsGnDNlnHvwLQiRx6L/Wb
 u1H0NTfbfn/UGckG6OcUYMxrcBJujHgmGKsYNaHO9sJJiT1MrORqxD0ck8zRTLnS4+ies4dKeHz
 zy/D8MLbfUuN+bS7dcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXy+LS3hos2IHY
 2MZ3Fez4jnR68eAaaFSC0QrXt9/AQc4wXrh0HUhmRFObM68YAXldvEWfPIKn+sEgLOf5lklfi0m
 5ybF5cfN84aWKmDCVHfJUPg9hDunAqY=
X-Proofpoint-ORIG-GUID: 6urdDfMaRN2qFo5WwKCHwaCt-gPitdkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Fri, Nov 20, 2026 at 7:21=E2=80=AFAM Zhao Li <enderaoelyther@gmail.com> =
wrote:
>
> With HCI_QUIRK_NON_PERSISTENT_SETUP, hci_uart_close() clears
> HCI_UART_PROTO_READY without hu->proto_lock and closes the serdev port
> without waiting for write_work. The hci_uart_flush() just before it
> re-enables write_work and may replay a recorded wakeup, and
> hci_uart_tx_wakeup() queues it from any caller that passed the
> HCI_UART_PROTO_READY test, such as the serdev write_wakeup callback.
> write_work can then call ttyport_write_buf() while ttyport_close()
> releases the tty, so it writes through a released tty.
>
> A partial frame that write_work leaves in hu->tx_skb also survives into
> the next open, which flushes nothing, and would be sent first to the
> controller after it is powered on again.
>
> Quiesce the transmit path as hci_uart_unregister_device() does: clear
> HCI_UART_PROTO_READY under percpu_down_write() so that no wakeup is in
> flight, cancel write_work, free the leftover frame, then close the port.
> A wakeup sets HCI_UART_SENDING and HCI_UART_TX_WAKEUP before it queues
> write_work, so clear both after the cancel: a work cancelled while
> still pending would leave SENDING set, and the next open, which reuses
> hu, would never queue write_work again.
>
> Found by code review. Compile-tested with W=3D1.
>
> Fixes: de8892df72be ("Bluetooth: hci_serdev: Close UART port if NON_PERSI=
STENT_SETUP is set")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
> ---
> v2:
> - Clear HCI_UART_SENDING and HCI_UART_TX_WAKEUP after cancelling
>   write_work. A pending write_work cancelled there left SENDING set, so
>   the next power-on never queued write_work (Sashiko's review of v1).
> v1: https://lore.kernel.org/linux-bluetooth/20261118124821.3990-1-enderao=
elyther@gmail.com/
>
> Before 6.16 the quirk test in hci_uart_close() reads
> test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks); with that
> context line the patch applies to 6.12.y, 6.6.y, 6.1.y, 5.15.y and
> 5.10.y. It applies as is to 6.18.y and 7.3.y.
>
> No new W=3D1, sparse or smatch warnings.
>
> AI assistance was used.
>
>  drivers/bluetooth/hci_serdev.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serde=
v.c
> index 194f11251cc5..a5e4b3d32144 100644
> --- a/drivers/bluetooth/hci_serdev.c
> +++ b/drivers/bluetooth/hci_serdev.c
> @@ -164,7 +164,20 @@ static int hci_uart_close(struct hci_dev *hdev)
>          * open may drain the battery.
>          */
>         if (hci_test_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
> +               percpu_down_write(&hu->proto_lock);
>                 clear_bit(HCI_UART_PROTO_READY, &hu->flags);
> +               percpu_up_write(&hu->proto_lock);
> +
> +               cancel_work_sync(&hu->write_work);
> +               clear_bit(HCI_UART_SENDING, &hu->tx_state);
> +               clear_bit(HCI_UART_TX_WAKEUP, &hu->tx_state);

Looks like you are mostly re-doing what has already been done in
hci_uart_flush()...
Wouldn't it be simpler to have a hci_uart_flush parameter to not
reschedule tx on flush?

> +
> +               /* Do not send a stale partial frame after the next open.=
 */
> +               if (hu->tx_skb) {
> +                       kfree_skb(hu->tx_skb);
> +                       hu->tx_skb =3D NULL;
> +               }
> +
>                 serdev_device_close(hu->serdev);
>         }
>
>
> base-commit: 1d79f61152c315e30e758116e525871732181a98
> --
> 2.56.1
>
>
