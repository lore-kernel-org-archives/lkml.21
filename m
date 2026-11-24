Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526155;
	b=cuhiKl4Dp8T7HEJsRiQliyOlOTL9It+vsYc4KHKugRYipQzDRXpJIQPPIzxCvWJ9evuO
	 tNcTCNi1zu+IJIJwoLdCWHW2za6CltSRs2kl0Aj67RpcpTT/UMdbK10PCYyw6nWEqLwNz
	 Ex67q4rZ+F9ITiGujNKT14cLq0g6eFgtGrh+OxUjiEACjsVC/LMatiUEuLwvtEv+JH0O/
	 UintYX79Q2TK0uc6/O0rAxN6ooIMjLmxENI9bHuNqosOKy5CWT66PSkXaKkQJAuAKPMpI
	 /huXFzAcS9hMaZm9yjeRh1dNct3D+cMCtg13AMyEBAOx39HlmL9Vr2jgx9PzR1ikNPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4IGgQBVfg=;
	b=VBN+8MUplo2JW3YaPEyF0WAG0pygaeoY9bdi8CqrUAKsPlz/CVRd+gcuRk6xm6FZWPbY
	 aw4703vn/S21TsddEpl1HXj3l5KzJfP9Wo3U9x71h6/a3NCTfUcktZWtNqC1SVbjJ1pPy
	 BnLvI2szdRMKrCSLmqgIez0ITdO8nLbs6xtISAl5HwzaRmmU5UbMJMC05djTtXSi4iLaG
	 Xq69+eFxnR4v6BmQiSUJYw7TEQMo7lMHkItv/7lE7CYPeBe3Oh8wJoURx4HsbXIemDbVP
	 bjV0Ow1yproYEfunJbUDvNTfiHeVvMuEQdisnxaxKFrtaV3PubKqgOaFzf55yy4BAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWbbW+qY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNplS5R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B77606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B77606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWbbW+qY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNplS5R
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODAuep1408599
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4
	IGgQBVfg=; b=gWbbW+qYJJqZVeNsj/m3LH6JEVcJ/y41McoLfO76BjlOQqEIAej
	63688POeQ8aUyBDlVFugL+eg8KlsxZNjhcDAw/a497Lzb8Nok7+DOskrxH44cF25
	CxE65EdxMxHQ+26Uo0le700W/BEjrztik5DpmPeUBC5htVBBiz+KDh7daXHztAYQ
	Y7Zx73es8NwbWuw6JSJUvfJcErYkC8uGPeInZZNL7gLq3qlSlosN+fbryA3xB9xN
	MzceXMaNlFxWAGHVlms02aESHmapQrLZTmQEcJpwxTGKb9mtC/u44ME6u9oz0OrT
	OqPIeLBjWMetAKSZSIY9EUnaNcHTxpsNjNw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8000r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so2646548eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526152; x=1796130952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4IGgQBVfg=;
        b=bVNplS5RavNY7vJhnKusGKTIh6Ys9ce7Sh1Rl54gHRm/2E+5r7KzppWZyqQIT6PJnT
         rcGqh/NyCs5ajX9gTaJzHll3/2oQOSaj8nTWWT8zsiwU59GEciY65FTzZTwG1+Uf1r4/
         KPlpVIn/i8bnSstoqw7Ryh4//7NJ2CP29ePEke6sscL+sSKxx/VjYhg7jqMUrwoOeNB9
         lds0g15/qt6oX2WXoQMkE5nSq7kcsq6k1QOz0HvCmm9L9pb+7bObnKbvy6eKbLNBSwTc
         87qLxM48l8PBhhbOhdCQcmPHJvkQQtug23Wkf7+SbQJPCxID3kHTkKidkSphK0x6VeD/
         O1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526152; x=1796130952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4IGgQBVfg=;
        b=yGCPGYeq7Xu/nHnA2iEHYp0IxjMbQ5or25gAymniK3zJNjNH+ybuJifu3S5fvFmZ58
         o+BbYjKmaoFZVbc2PfHisQgE04WlQY/TOaxHcoeBkDpiS0sgOFnDDw1UcnYc0VaJBzlz
         zZsGwEQm1qiQT8M63B3+DoQjE31i+stJ9pIDa22ExlvwNVJ1smCgHUcdYFhbono5e3Qn
         +dcS92Moz8t8zzpTjDiqxgSi6aWiZdalxC57LY+Gsbo0Any3V+545h6DweQ+ADGbGZ4f
         WieRcLZ1rVf4o63D3f23cqtXvuLeluovUE89N9WwYT+agoTV66hWmXwssY+XQR+Kqs0A
         rSQw==
X-Forwarded-Encrypted: i=1; AL+hErFRR8aWqFySUQuQJChZZj+CpOI4eZqeUZO/vIrwMrTZt68trhuAeplJagV4EkPE8YxzLXzRiIeXL+KHknY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mHAC9pDiiUB9dxOkdSXZwHja1G5i2rU/QnEqtPUew/LMY1+n9
	BRdvZVBO+xsLy7vWDwDLSCe79HYLIT8ljoOyA3oamSOq31vd0Qso9Flv1zNytrMGzv6PFSlvO0h
	f65zU0028zpUTR7lV/NFAmFsKpBwF1rFSaZJJqA7dMgUUha/sglmFfuJpXzUSmrADMXs=
X-Gm-Gg: AZFdTZeV9I6mJ2m9HFeSqDk05UlAfBtbFwBZCc2GDURKWNkFVGZ2EQqxK6Rq2zd8rFo
	SWx7mi2ZwWVPvPr/9+pT1mQT9j4JFXsrOFQCthF5igAs5hfecHV7Ijrj68mUlajF0p0QX9fYwrF
	tQQ/Oy9NMmC7ugQPnwUOgIrFq1PJuIzzDy1FnHQx74zMSQCjGKGAvlFVf00abe27StXob9hAEi0
	w5BQP2CtSpqCeTrr7PxgGKv9FrMcplwjhy9tq8p8hkrLrzPAo9P2r2cPMEtsX0TVO50oEXYdW5M
	0ijWCKyJvzizQEvrHs56PoT0PVQi42Fdls58ld1My+RMTNVShbMc9foM7ALE4G7RKYfBFgLT56e
	ialjDX9c//M4cgH9hD7MDRLfTtGPG+bjpBRfvm9CxoCtN6et2GsUy5EGNyDrAqEY8WhHP/tDGQu
	0YJ82vbj85+tJyhauBMv2LIYwRVdzfSjziqgpJHV3fgX58eQb+FqGUedu3n5Wg8g==
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr23266453eec.10.1795526152004;
        Tue, 24 Nov 2026 05:15:52 -0800 (PST)
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr23266408eec.10.1795526151105;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56371320eec.4.2026.11.24.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:50 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v4 0/2] Add RISC-V SBI watchdog driver
Date: Tue, 24 Nov 2026 18:45:40 +0530
Message-ID: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfXz/Ei0PTxaaYA
 wIrVbwGJHNs8Db1IMtt20FGo7GiLAxryzhIJV8DkobRaaYE7DLMn920/V+PNVM9FjMjpyubPoO3
 3cF8HVKvG4Pl96y2t+Q7SFkQaAs0JoFlq1U/SwQ4+nn7g5HaXx1LsY9dbQQHaOUqxraQ4fFyS0L
 WxpZOQpGt5C/bE8dIwmn7VH8xQSLsf8DOkFu8/Jcb6c1UnV13FW1P+APpOV6tqGQWDTfjGsr5xS
 2/v3xQMtJXvHVgIKSxo1lDIQyTy/lA4BHgm3P9UmUjG1h6dS0/8yvjdxuNNcAT2cxe+wYP27PXD
 Fn9W6MPiM4AWRuBFT5NIaeCEFMRIGMG1vPg3hsBuFE4I+qbLhRYFKAA+jLNhK3ChjtoMoOa64Wf
 OdYjzd3CJDiFal40rh71Q90sLflq/1492ww23O+dfN17FIuWOUuKowXvNDWH1b52vkUYCP9OEdO
 92V+q3lVIOhJXiQA2yg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b058e09 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=0SxRSwYGAAAA:8 a=bDjJS1w-zusUvRiTzisA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-ORIG-GUID: ght_mDjr4oV6GS0lS0rgAvhYcRjGklqj
X-Proofpoint-GUID: ght_mDjr4oV6GS0lS0rgAvhYcRjGklqj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX0Km1S1aHOitx
 +ofOz1TJ0cD8gggHu3w8ThuL+0dKcZKoFGtiv4G9iCG4igrWBtkMG0sIcXebA8mvBgOcYCn3Y8f
 Z1y++1kHYZbZUYHppMtA2LW/jWp5y7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051

This series adds a driver for RISC-V SBI watchdog extension.

The SBI watchdog extension exposes watchdog including start,
stop, pat, read and write attributes to the S-mode software.
The kernel driver uses the standard SBI calls to interact and
configure the attributes. The driver integrates with the
kernel watchdog framework (/dev/watchdog) to ease user-space
implementations.

The driver currently subscribes to the Message Signaled
Interrupts (MSI) for watchdog pretimeout events.

The series consists of following changes:

- Patch 1 adds the definition for SBI watchdog extension ID,
  function IDs, and various attributes that are supported by
  the extension

- Patch 2 implements the kernel driver that utilizes standard
  SBI calls to interact and configure the attributes.

This is based on the OpenSBI watchdog extension implementation
patch series available at:
Link: https://lore.kernel.org/opensbi/20261002083040.2533097-1-prajwal.n@oss.qualcomm.com

Steps to test the SBI watchdog extension
1) Compile the kernel along with watchdog kselftest for RISC-V.
2) Compile OpenSBI patch series mentioned earlier to generate fw_dynamic.bin
3) Launch QEMU virt machine with IMSIC support enabled.
   Note: The following command requires a rootfs.cpio packed in Image. It can
   be modified to use rootfs.ext2
   $ qemu-system-riscv64 -M virt,aia=aplic-imsic -m 2G -smp 4 -nographic \
     -bios fw_dynamic.bin -kernel Image -append "root=/dev/vda rw console=ttyS0"
4) On kernel boot-up, the /dev/watchdog entry should be available and the
   kselftest binary (watchdog-test) can be used to test the functionality.
   Following are some sample test cases,

   - Dumps all the supported options.
     ./watchdog-test -h

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 2 -n 0

   - Starts the watchdog, configures the timeout to 8s, ping interval to 9s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 9 -n 0

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and configures the pretimeout to 6s before the timeout.
     ./watchdog-test -t 8 -p 3 -n 6

Changes in v4:
- Address review comment in the commit message
- Improve the comments in code to address Sashiko reviews

Changes in v3:

- Address Sashiko review comments
- Select WATCHDOG_CORE in the RISCV_SBI_WATCHDOG config section
- Appropriately return from error conditions when using dev_err_probe()

Changes in v2:

- Address Sashiko review comments
- Fix silent overflow in sec_to_usec() by setting max_timeout to U32_MAX / USEC_PER_SEC
  in probe, preventing timeouts greater than 4294 seconds from wrapping around silently.
- Add pretimeout validation in sbiwdt_set_timeout() to return -EINVAL if the new timeout
  is less than or equal to the current pretimeout.
- Advertise WDIOF_PRETIMEOUT dynamically at runtime by assigning sbiwdt_pretimeout_info
  to wdd.info only after MSI detection succeeds, rather than statically in watchdog_info,
  since CONFIG_RISCV_IMSIC=y does not guarantee MSI availability at runtime.
- Fix MSI interrupt leak on probe failure by registering platform_device_msi_free_irqs_all()
  via devm_add_action_or_reset() immediately after platform_device_msi_init_and_alloc_irqs()
  succeeds. This ensures all subsequent probe failure paths are automatically covered without
  explicit goto labels.
- Add module_exit() routine.
- Replace dev_err() with dev_err_probe() in probe() error paths for cleaner error reporting.
- Link to v1:
  https://lore.kernel.org/linux-riscv/20261002163758.2919372-1-prajwal.n@oss.qualcomm.com/
- Sashiko review of v1
  https://sashiko.dev/#/patchset/20261002163758.2919372-1-prajwal.n%40oss.qualcomm.com

Changes in v1:
- Initial RFC submission

Prajwal N (2):
  RISC-V: Add defines for the RISC-V SBI watchdog extension
  drivers/watchdog: Add RISC-V SBI watchdog driver

 arch/riscv/include/asm/sbi.h     |  26 ++
 drivers/watchdog/Kconfig         |  10 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 442 +++++++++++++++++++++++++++++++
 4 files changed, 479 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0

