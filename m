Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790646;
	b=u4huTjsT+jeabEPj7Ws6Z6LiNI9ve554owz35/zvtpNgyvj0Z8aNFlwMWojMuxkNqoVe
	 cvBE82HeRxKYKJc64WDaDxQB9uGvJLIUPD0iUgVdMhuvsdTgyBg0nUtQe8RQcIclsmt4i
	 kBZvtY1+ll1Rh2zkqOD+4hukfXZohNj0Sn0wF/FqgNYb3IBCoqffc6vs6huq/eCdCVlv/
	 dalHRQkNurOdRSGBJf63qRU3Lta0mIm9+SEg4qL4ZHPawjsc206opnF7MtQ+lcAdbMiOs
	 p0sa3rQ0RoFoPiOqDJAF5AbAS90cIINYGI5aB6mZIGlfMTXHsRWHNKZAYvZC3EIhaOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gm0SC2OoLtHJGqeYOnwPOMS823rNI5WQcbZ6VsTFSFI=;
	b=OJfqSpFnFKKw+atywy2dlZgm6S56n/trF7i1FsV12+Nmtms1aPOSo8MFdkbNGXibphil
	 l/jZZTqnuLwRVcXmmwfYWkHPM05YF225yBSIETJaPSJfFw11rJn7cB+V9iuM/obbY31yr
	 ZX9KYmKMIaqm2yNuOLDs6TbBYFwN2b8U+tJQSMi7CUX9EV8k+D+sWl7sS9bM8P+6nxVRU
	 kAtgDA1AhqUw3B0Nn32BwDZwiObcuMeT4eyoZJdz4KnrToIPKqjEBB6VCDGDXVvlPLO6M
	 Wq8YKPBqQnWq6QmDooTANLxpvV34ZoEYcppVzlo7dr0Rvnr85OfPX3y6+4cO0Vu8sfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ITRN7jWd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jorthud0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C0606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72C0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ITRN7jWd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jorthud0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1JBC3089111
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gm0SC2OoLtHJGqeYOnwPOMS823rNI5WQcbZ6VsTFSFI=; b=ITRN7jWdYeGit414
	XY3MbIRB9nhtVM3YTmBem8rNTpiYSz3nmz89N9qpObQ8vD8xiNmmgBtqM7Nj77TS
	wiRqR4rnq33IBgBYfAGd3DjRhPAdtArY8Cl8jn/S3J4JP454iQ5O8oqCFxDTE7er
	OWcGUjVl2a2OI4YLva1KFmWhQ3ijMLB3woYgdXVaU3JQ+x3qAXlJYfzLXIPEgoNt
	df4h+Le0zFp9J4vHtGzAXgX946RjFf4XFpmm/C6gcFt9tLACIZ567INGtkih1/Bj
	IXQv4Aeabp6Tl6pqrfDH1Uwv6LD2+WVZ+bKKEIgN7O8HjgBuyEJVT+UX/k5mM2cm
	7Z1O+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9u4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so6949812a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790644; cv=none;
        d=google.com; s=arc-20260327;
        b=FMp/gUCaWtS/ElzpoyWdjySejgGlEELszzBmB59kqMe/0jEbU90AC4zlBoJC46Gpb1
         UKFPlqLuAeJ6llo0umO76faTEUndFV6odD1n6FCd/OShUHq+mzsRy5+LTr8Ge2lZ5Jay
         03aFOfltFjaQVF2okxv2pCftD4224JdcKJFbRsF/wmaPQhcA8TKHAOkud8OyWMLMpKTU
         7jLa2wUN1ISp7bb7cj9tKamSa7fftzXtcBK8iFKEu8SM9lvPSb9Wj0IIuDdqBTa4xatC
         bY0u9WLAMhRedLmaEHRkdYJOBXN55OwacfKb670GdpZJnd/dOPkjC2XBrDcGjesG84FD
         RQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gm0SC2OoLtHJGqeYOnwPOMS823rNI5WQcbZ6VsTFSFI=;
        fh=MEKHVzkSHg8l8nd6p7c1tmteHpfToXH8SXyegjJoUHs=;
        b=QvofjLIlB/W4jK6a9+ovwZPJ9WO8oi3INNxss8Zjhda2poJkOnY/w3hFS5Xse0qeX5
         Q1Bedtd+1XTvvRKKzeVpV/sbMCgGyjacrvVLSWvQyPf0P044wrGa8nxSsJ3Hr7pwkgCF
         +sKFpaPz6qFXNKxHdeSwkZ8JGhBrkXaK3/5wyumGpgv367mSOP+n72pMgh1ZziWMEm7k
         iqKxN/MAgxhgO1aI8PwgCuE/bFovDzrv1iRrTwvy5GYR4ineWOZzPWBk0P0uW3oLEZRe
         Ws79Xhrs4ZfLls5GNATfAXr7XNOqNt1n4Qjglc28kEHX/1I8242ioQb4cHhNfUVE5f4S
         Bccw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790644; x=1796395444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gm0SC2OoLtHJGqeYOnwPOMS823rNI5WQcbZ6VsTFSFI=;
        b=jorthud0+RB/X+X9tbTS6/DCRtw5MKld63wKX3a2rWCR0jfRBab3iWyTkgeH7Q3JRM
         q0QlFab+6uGWtLQ0BtcAXqSIJ/HZVDQDjmunog3f150q4K7oGWwQO/1E+CCfcbBz1g17
         CCyws5umf0Khzb093rjgwehrjBr223Yu55A/cZEFalBuhzTA8TqNDMya/Dsp6POrWdzW
         O3ZsU7+AMeLkSWzhKuej4STCkFSDHhyqMWs8IGq5Z214ZJG4JKgHSXtl96SfhU9XyQeS
         ge+J08zhIPeQ2JQ3FUnnM8HQw6v1Ddl/2mhvqaC63m/1aQH7yuSQA72Y6p4p6+IDnmtt
         H7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790644; x=1796395444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gm0SC2OoLtHJGqeYOnwPOMS823rNI5WQcbZ6VsTFSFI=;
        b=WDY0i+YS6fsXzbf/c8U9ECFJyMwZqSnzvr91hZCyMSnwQDldl2z9nI5p2ogsiJX6jB
         FritqG8HpoZ+LZook09xX3Vcstf8Dogb3DpmZUVtgZw1Byag6AwOZI948abjfSYPbBLn
         1Z39Xab3x74EEd6ZH4cSvFANlDyyXsMYLn4Gp97T3rMzA//GexcGw7Sadw8gwN1yk7FM
         2T1i4zj/K20ImlEVarMNSNq/0mtHsiQdVE5KClc3Z50Xwrlmn7l0ebeLHkLcN1POungi
         NPGTunQ0Gj6n7fG873DtJhyenbmN4jhSgvzr9n/YlFa3EFOqekLYwc2UUYCDjQUCp+ci
         PaBw==
X-Forwarded-Encrypted: i=1; AL+hErHXQ8gDW+azzPFs0W7SQIsLjBH4mGHNf+9lOHeNhqVhhmAXOM3kalaImnsIroHhPEjMcM5XCS52AW8Epl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZEpjns1CEmejkLDYN+OPUNF132L0FziABmsl0mdWCP+VugpMK
	pSMbbU+yFoKmzWmXjdp2PGYSZ+9g+Xqaa3/dF3eWQKkKE4/oaL4/sg/A3Mz2DI0OtSmLmFU8PLi
	fmojR4fLUOQhGTvLqNlyh87h3sr1gqG03SMzgyxnGZ89JE4z8MNjIp6W7eXqVTVZFSEvmbNvQV6
	EFI109gbaN2HeXZThNM9cNE5sFAu4YN8I388DxGUiDFA==
X-Gm-Gg: AZFdTZdfAbvltBiwI/qSrjvUydP3+Tayooh1WBXXqxhbSj9bTrJM5LtQv1EtZXtb5bP
	63I55KeS7lh4yijyrV9Orv64moBZFJh7Tys0lvYjpatyKfw/kV6tOA4RnWZpyBNuFx4wXuzmeKb
	+hgvwOUza/UNXssoyj932Q5tvug2SpUq091p/m5sVCwybgtx8cjYqBy0rtjg==
X-Received: by 2002:a17:90a:ec86:b0:3b3:b0f4:1bf5 with SMTP id 98e67ed59e1d1-3b41c9cf154mr22306745a91.25.1795790643651;
        Fri, 27 Nov 2026 06:44:03 -0800 (PST)
X-Received: by 2002:a17:90a:ec86:b0:3b3:b0f4:1bf5 with SMTP id
 98e67ed59e1d1-3b41c9cf154mr22306703a91.25.1795790643094; Fri, 27 Nov 2026
 06:44:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112101443.62417-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261112101443.62417-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:50 +0100
X-Gm-Features: Aa3M54prP2UHzn5PjkT34uEO0dhZsx3V3cq8jc-3H7qImBJ0krZzEtCQlSs-mao
Message-ID: <CAPx+jO9Fzw5Ap84-hG-tw_g+hOfp73-Ox1yY+T_WrXZdUrZBqw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mmc: Drop Asutosh Das
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX9CPxSWPvihyZ
 v4AvrE2Et3+UvtSfQ8A6wpSnrmMcQaCVc1t1Sc+4AVFk1KPbvA4XeBielaus8AcinFZcKVhIaqY
 hJo1QFROEwzfxvnB9HE0UUZXkhjSYvc=
X-Proofpoint-GUID: lBfyi41sl2KPypmfglLRCkOCHbKtimas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXyuhvF7N+Iqe7
 wBh/7rZKPh1g25sqeZpW4Y60Jx92LLt7Cu3HejVh6B4Kgje1V0UkwB87u1BIhbmidF5uAuOCiWD
 QE6Zs4JKmpT3NPLlOuFWScctQC5PnBwYQ5XiLcjtKI4tfsh8z3uC4yUFmItxzauuShQI1h+9CqC
 ChBziEiHX3KJaDnFHj5iuwQhS/RULaqnjm48oRut1a/krf7FxgUqYdrmyfqzuf26sqpiapTsICh
 vaIFDRfhyHkwrFthsryCzkHxvjc6utVEmVMcGNKZgqOa93yqruD/kqHwCkADyhKiO0GvbSuLQ0g
 bKVQ+kaAGgWgDbrCYMuGhMOff1EeozInyQPTEFoYbYayPfmfS/MvwdTdBLQyp6OCeCIJqhmQdp+
 ztoUnGji1zCo0v8Qa4O0PqDdG1ZdkLjEsarmJJV8c93YmT7Nl8SUe+PzPs7kiul6r6yZ7kXUs4X
 l8ySxDvT/OWdo6XGT8w==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b099734 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=sIzR1sLO6NqiVEzso7YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lBfyi41sl2KPypmfglLRCkOCHbKtimas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270058

On Thu, Nov 12, 2026 at 11:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Emails to Asutosh Das bounce permanently with 550 code.  quicinc.com
> domain was long time ago changed to oss.qualcomm.com and every Qualcomm
> maintainer was asked to do the update in maintainers file, thus if that
> update did not happen, then maintainer has moved on.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa647f5d37dd..b0ba5fd61b33 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9868,7 +9868,6 @@ F:        drivers/media/usb/em28xx/
>
>  EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
>  M:     Adrian Hunter <adrian.hunter@intel.com>
> -M:     Asutosh Das <quic_asutoshd@quicinc.com>
>  R:     Ritesh Harjani <ritesh.list@gmail.com>
>  L:     linux-mmc@vger.kernel.org
>  S:     Supported
> --
> 2.53.0
>
