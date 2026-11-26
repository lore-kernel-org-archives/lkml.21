Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686959;
	b=T9Q8Q8X+b5Fw/mbPe33C/CJAcgMeDlTKooaXOdbT5cQHI/itqwEe504Z8JA+N1Xso2vo
	 kIxUgNKUqpBdkJB33GE3y+nmLz12WaaHKafaUH3Vg8jaiUf9migbOfveZTuykKhyMb36o
	 Tq1fNv2FAlluQgCJ7cPyN8nYJT+RCDpVrWzMuSDVH2i7o2T4xynI7X+Ye6rw45DCmjdnd
	 vRYDzHXnKZeVAtb9gu7Ngc97S60IqrrTXjW7tgec6RmojF3D3LklZJ80w/3seroiJWeH+
	 iRgJrBoY0JeRfLJSI1Rh9L3I/dvS2puJEhA857Dtt0akdxwBlvtZMy2AhAMT0AIhzqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2u34yaw3w=;
	b=xWaoCkqtgEugJ3zcT0Y8Z0ug7nhc83YvXihQkfvaL4qa3YwTjdu9bCAcFovhYmDb0XIj
	 hfFGGfZS3KjUpAtQICAvzNQR2R29Rtw4kwqX6waF6I8k6lzgdcBh0pOl2EU0HOy9ynL37
	 kZ7uBzMv79QTnvQYl1vCGwWj/yxL035gXyFSJRtc1rmKkG+laUmSGJUytSNWyPh2ukLp9
	 xxv0dZceMaA5I9s5zb150aY2uRUZzJsgdjxsT61UQHr0raTgoT1iVk4768jWLuXIxWDl+
	 ez8G0bAPvj2HZSM2EbWVkgsvheD+mYUgkfIxIsGT2u13tozBUD/gT2g4uTYUMULBo3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGpwOGj6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6Qx8zzx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF42606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGpwOGj6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6Qx8zzx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuYs2594835
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2
	u34yaw3w=; b=mGpwOGj6xIJqGyO/JwShyTu4uIcdDwj8DyJdmRzsUzndzNhYMGe
	D2HodX+oGO3fy/QiHC9KyDsibwI+FZ88tuwpKKvVIGcHAXl1SqnYVXTrgm7A5Tv4
	4mBzL5yXpwanV6YGRFB+ePz8+tnYKQKEKTLpGF8raKNlmQfzD1W4MpBVp2Sz3nJ3
	v915BE8BlaG6q+MQS7SzSuAh2ym++TszuTCNXLK9f5Yr3n2NOzOM10vq6bJnoDgA
	pfBiWgtlIFtbzODm9yVy/qAcUcgaOR5ri+YhOHHxIF0Hxa76D0G7zqfQU064eNuA
	3pM5LyWznurOrCVj6ldAm4ovZAqT5TGOtKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sajyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:55:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5887155a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686957; x=1796291757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2u34yaw3w=;
        b=Q6Qx8zzxoVypRYHIizLGSTGMD/u0OsNn/pN8RmM/9K6pN+2yo/KSuLmPq0lxnk+pVQ
         vkKLtoTXqEssuXXAULapqxYUjgxwXTPwgIB8ajRtWr8GoScqsLHZgfYnD/talWBV+gCl
         /8/sK5gqAq3Dta3XitynXsY+/VRQa8HJY8CK7lKV/WQQOpyt/5zHzlK0o9PrHES6Dadm
         2Ogn7bRd3Hz1rjP/kVDhdw69pprqbnvRayJjeT2YXNEmr/+Y3GHgJptBqAbtFISzMzpG
         aMXa2asJ67gSZsbLqnVIPkEI5s/XtTLJKmgByvqMLUx39La+Nl8dTMJqilLZ8qZc/Xft
         1cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686957; x=1796291757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2u34yaw3w=;
        b=iIn6UUnxIXa27NzVyvcvWtYLQCdbw5fAIOaimsOg2QXg63+U1O2Z/HG0EgX8cG9Ypc
         lg7piDJ84rUgs6ALpHeXhHJZVwK8Vmxm/9/kb3h23HxukmWx6h1NwUUt07SpuFcbU7Y/
         e85LpOst49XL7DoAdvvKSeAAJmcZCq1Il4urPOii4sWcfrMUw8UzLjpwm+BuL7lOc8C5
         IgD5g+JAasiHIIPSm3yRoQ1VhRNYPPNmLgk69oVU0XpR0LN2H1ig/CsAKiWbHBUSQCcT
         P2PVAJWhyyPF2i0QlXo3VDRk5kSWp7yErhSxHTzLPMIMQ9TtDf+XsPSCSlEp2FeUqgcE
         OJAQ==
X-Forwarded-Encrypted: i=1; AL+hErHmZy8oV0IA616xQJHsXBTAZDpk3ct0MV6m6TmgU2sMx+Ipcuz9s+IKOhmHpFyZY2lrHWxIuWM9jru3KNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bri7OgRQptnnVhVW4N76Tn+7QNK63Vkiu+ESJT13z7eXL3E7O
	Lu5V2pFOjfvRQeJWfRCMDT82Rw+KbU/HTWhmJEC7ZE2/T+hLR2UwGN5rNux4wVM52CbUhCW7fU0
	LssRvbrQy8d6MeKjnf/t8QYnoHmdtIFPwldDFlbRhOWoH6I+xXMMqkEyyvOBQRkyt8H4=
X-Gm-Gg: AZFdTZdzHuaERC40eZUucpt4b8Dtp3g1UFyWQn4VSXlj566JGIrbcgarvQWK+CxtL2s
	WQeG8W8tWgkuS5N52qOT6/S8ZMwCdVTH2hObBvS1M4cgYq3Xi/PIp+jljn2JVjIWCa1/H2JIBhM
	1UUm/XPxKU4j0FUjN2JnOi9XFMvbvbnWNWnVP2XrA3N/2uLFM5pnCLyAqdyWjERd5iHWLcMiqjP
	Qti92nBdJ0q3+1La4gzXuXysh0Zi154muDgpQpnH+mdw6EMtzzZ/JeesH4j72JC+YVbP/VJXO++
	kMnebY5mN356dbBKcZtAE7LvPxhRpq0zGSf5XmYaF6ewObOhnhhSJCR7k4mS6U4cn/BpXAyhE3/
	OPhbL/sNoDxQPiXuKTX1UGCwBs5MwPs2sCMogVwUwJB5YOnlTmXV5y/G8Prvv+J/TrKqBNlAnWm
	z4HaAaOLBEQ21Y1T9gYILIMB69qR6+PZIHkbHLbCzf4LwFzU5tg9MPPPR9LxPhcIHOH8k/puNr6
	g==
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17902939a91.1.1795686957366;
        Thu, 26 Nov 2026 01:55:57 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17902915a91.1.1795686956799;
        Thu, 26 Nov 2026 01:55:56 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:55:56 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 00/14] Linux RISC-V trace framework and drivers
Date: Thu, 26 Nov 2026 15:25:21 +0530
Message-ID: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08022e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=S-okXXNRuRpZkZdKB-YA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: lL7QxaV4spEytqMQ03BDp6ifeI8Lutje
X-Proofpoint-ORIG-GUID: lL7QxaV4spEytqMQ03BDp6ifeI8Lutje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+/TiL19Ntmc2
 hc74LUlx6gV4yEpJ6AIDm/liuGVXiMNv1Nsbi57QNjMgOrX5427XDJVqwbNP63hk2eMmX9We1ek
 7K9Hv6Qeaa0tC6RxtONkaRQSddBc1APleWnMdMdCH0BTGM3yjy4csJwYcoMt4V2WyZmRsgzWa5Y
 LgA/X9KeUjo/RGYnG7OCe7wTYJ+CmJ2TN2wMjkAnU+fFkrv/2ZLZ/+j/BtSNy6D7hCAsLJoCB6O
 wuDHPiyfxqAqaLVctgxIuHi8mMOn7LMp44HUqGCHvQAIuev7km/IwRAbKhoFLde6+Ln+POChhps
 JxTDQbeGglZRPOoIvS37vDhldh+BE4tSP8jAzwL6bJnvCCsv8ZG36HyPGaQCTQ/cJ9maNk9MXAC
 o8rIRsyNTzYDki6sBwvQeQuqRule8OhknTESOucJMFRaH6+IOK/w+7liYx0/xM+aFbmne0JT8eo
 jdywnaNYu6q6wkPVbNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7l3Q6il24Plp
 b7tH6SRy6750PZyScsXBZh8jJE8XXJ6knyXKCTO9Zl6YWxh0bRyK0RSG6T2Uuco8wNbrjq+B8uZ
 dPXAPNAs67ADaQun06LzxKrCatvkYVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

This series adds 'gtrace' which is an architecture-neutral hardware trace
framework with RISC-V E-trace as its first backend. The 'gtrace' core framework
has the minimal shared plumbing (component registration, path create/destroy,
path start/stop, etc) and the RISC-V trace drivers are its first consumer.
It should be possible for the required ARM components to be adapted to the same
framework in a future.

This series also adds initial support for RISC-V trace component drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The drivers use the common trace control interface. E-Trace remains the
preferred format for the generic RISC-V compatible string; the encoder now
reads back the accepted hardware format and updates the component's format.


In the future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) Arm component support under the gtrace framework
6) ... and more ...

These patches can also be found in the riscv_trace_support_v7 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace_v4 branch at:
https://gitlab.com/danielhb/qemu.git

To capture gtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture gtrace data
   $ perf record --all-cpus -e gtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the gtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual gtrace data offset.

Changes since v6:
 - Rebased on latest upstream
 - Add a gtrace component type of NONE version-zero components can match
 - Hold gtrace component references for firmware-node and CPU-source lookups,
 - Detach incoming/outgoing connection pointers before removing components
 - Balance temporary OF node references and outgoing references on parser
   and platform-probe failures; fix the CPU-node diagnostic lifetime and
   the OF module device table declaration.
 - Use a spinlock to guard trace-ID and component ready callbacks 
 - Probe SRCBITS using all possible allowed widths and select the final
   allowed width
 - Read back the trace format (e-trace/n-trace) supported by hardware and update
   platform driver state accordingly
 - Make ramsink register-pair helper functions generic to gtrace
 - Copy AUX data from the actual path sink and not the first component that implemented
   the aux copy callback.
 - Pass the available AUX byte limit to the core and sink callbacks
   whereas sink driver returns the actual byte count and AUX flags.
 - Release AUX mappings data directly in free_aux() instead of deferring it via workqueue
 - Set the AUX_OUTPUT_HW_ID to the encoder's hardware source ID 
 - Other fixes for issues reported by Sashiko bot
   
Changes since v5:
 - Moved the DT connection parsing into the gtrace core as gtrace-of.c.
 - Added start_count and a lock to the core's private component data
   to serialize start/stop/copyto_auxbuf operations. Dropped
   perf_buf_lock.
 - Added handling of partially enabled path by disabling all enabled
   components
 - Added cycle detection when walking the trace component graph
 - Added trace source ID configuration in the encoder driver
 - Added trace format (E-Trace/N-Trace) selection via the platform driver
   compatible string. It is used by encoder and perf drivers to set it
   into hardware and perf data header respectively
 - Modified the ramsink buffer setup to read back the trRamStart and
   trRamLimit registers, and program the sync frequency, memory format
   and stop-on-wrap settings at start time
 - Improved error handling and added path owner in the perf driver
 - Fixed several issues reported by sashiko-bot but some of its findings
   are deferred to a later version.

Changes since v4:
 - Introduced a new architecture-neutral 'gtrace' (Generic Trace) framework
   and moved the RISC-V trace drivers on top of it instead of a RISC-V-only
   'rvtrace' core.
 - Added new PATCH3 "gtrace: Add RISC-V platform driver for the gtrace
   framework" to split out the RISC-V platform/DT code from the core
   framework patch.
 - Moved all rvtrace driver sources from drivers/hwtracing/rvtrace/ to
   drivers/hwtracing/gtrace/, with single Kconfig, Makefile using
 - Made the perf driver (previously rvtrace-perf.c) architecture-neutral
   and moved it into the gtrace framework as gtrace-perf.c; PMU name
   changed from "rvtrace" to "gtrace"
 - Added new PATCH8 "perf: Add gtrace AUX buffer trace format type" to
   define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE which is used in later patches.
 - copyto_auxbuf() and gtrace_path_copyto_auxbuf() now take an output
   parameter so the AUX data format can be reported by the sink
   driver by setting PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE.
 - Renamed the generic side of the perf tools support from rvtrace* to
   gtrace*. perf.data ABI is unchanged.
 - Fixed gtrace ramsink start/stop to call gtrace_enable_component()/
   gtrace_disable_component() to remove duplication with code in
   gtrace-core.c
 - Updated the MAINTAINERS patch to refer to gtrace framework instead of
   rvtrace

Changes since v3:
 - Rebased on Linux-7.1-rc1
 - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
 - Improved PATCH7 to save the previous WP value

Changes since v2:
 - Rebased on Linux-7.0-rc1
 - Addressed Rob's comments on DT bindings in PATCH1
 - Addressed ref-count related issues in rvtrace_of_parse_outconns()
   of PATCH2
 - Made RVtrace framework more generic by avoiding implicit access
   to component registers in PATCH2
 - More improvements in trRamStart/Limit/WP programming and other
   improvments in PATCH7
 - Removed RVTRACE_BUF_LEN from PATCH9
 - Removed redundant page_size from PATCH10
 - Renamed found_etm in PATCH10
 - Removed rvtrace_recording_init() declaration from header in PATCH11

Changes since v1:
 - Rebased on Linux-6.18-rc3
 - Addressed Rob's comments in dt-bindings added by PATCH1
 - Get reference of conn->dest_fwnode and add missing break in
   rvtrace_of_parse_outconns() of rvtrace-platform drivers added
   by PATCH2
 - Added new inline function rvtrace_comp_is_empty() in PATCH2
   and used it in rvtrace_encoder_stop() added by PATCH5
 - Fixed trRamWPLow usage in PATCH7
 - Determine RAM sink buffer size based on component implementation
   ID and reduce default RAM sink buffer size to 1MB
 - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
   so that implementations with RAM sink address restrictions can
   be handled.

Anup Patel (7):
  dt-bindings: Add RISC-V trace component bindings
  hwtracing: gtrace: Initial implementation of gtrace framework
  gtrace: Add RISC-V platform driver for the gtrace framework
  gtrace: Add functions to create/destroy a trace component path
  gtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework

Mayuresh Chitale (7):
  gtrace: Add functions to start/stop tracing on a component path
  gtrace: Add RISC-V Trace encoder driver
  perf: Add gtrace AUX buffer trace format type
  gtrace: Add RISC-V Trace ramsink driver
  gtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for gtrace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 120 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/gtrace/Kconfig              |  59 ++
 drivers/hwtracing/gtrace/Makefile             |   9 +
 drivers/hwtracing/gtrace/gtrace-core.c        | 962 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-of.c          | 133 +++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 368 +++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    | 274 +++++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 194 ++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 366 +++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 382 +++++++
 include/uapi/linux/perf_event.h               |   5 +
 tools/include/uapi/linux/perf_event.h         |   5 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 220 ++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  99 ++
 tools/perf/util/gtrace.h                      |  17 +
 24 files changed, 3356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
 create mode 100644 include/linux/gtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace-decoder.c
 create mode 100644 tools/perf/util/gtrace.h


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.43.0

