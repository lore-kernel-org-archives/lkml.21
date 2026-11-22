Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389047;
	b=cmK08Od80mtz50/WObYf/aydCWz3n+elJoR5KCQhIyp3CDspLZ5x4AxP5SWLhTTVvWSv
	 DAdqZBtf5mME18n9rCebc4CJqg4LGPpFfJOmTvrgg9mZoR29eXit2ykB44RdT4iZVIMDr
	 HrePnvfdK/JnOYnCfZkLeaOr9AE8fTJGtFerZneEEyYxCQiKyrFaynLeC2+K4cVjNWnFI
	 D9ch1Cqcb615sPh74NBxHIOEDbxsqX6UvS2jNw9m2V0dsv+9xHzqt4rVI4bYm9wKqPdTO
	 HruKxHKj5l2twuYhZF3WXTB4bWcBXAzemKtqQPV76trWQDuaKz3IMaHfTCfNWBfAVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=qnQGLcAfrUqQwy2ZJMUo64SUUU+xRQp+nJD2HvFI93o=;
	b=QkUscXC0iLab0bHS0caS1+0XtuphY9hcsRPCy0A7UmJZDZEsXSqnOcoUKC5DtWWkoLx0
	 RTVc59VkDxq+Llq4BCmQu1WKCDgVJedF9n81ilps3QplV61J9MCTGoT1zJXBHMW/YHV7s
	 28Cd2wtpuUsUvj0mSFCX9h9p7bE/muNOrwX6GGFDlwLjlyVUshMaB8rAVfHes41xZcHtI
	 fvbnCipPEnMbm10SSmuERUc63h6EhcoETg1/QdZeF8llX7taPugYt6n2B1SRfEJzjGLpd
	 GrZhlmbeQOHphVghcMMW5XSPY65tExJHgDPAR60r8jchWBmQiax46z9Nt0ukazMIdnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fD5VqgEB;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE6606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fD5VqgEB
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4322d310e7so477294966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795389044; x=1795993844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnQGLcAfrUqQwy2ZJMUo64SUUU+xRQp+nJD2HvFI93o=;
        b=fD5VqgEB9TRG672wcZ9WSj91VKryGZMn1Oy7n4Hx+85Hqhtshthb2DTob3oxOX+DMN
         n4059Xo2a6yeBfc9y6gWpLV6Zt4q6lQ0gAN+yOyCyyZ0RW6s5u20BWqxYERTpcE51kSx
         aqDOFWKvX4VZSZnH0lVJLx0saNLF/h4OAmhQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795389044; x=1795993844;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnQGLcAfrUqQwy2ZJMUo64SUUU+xRQp+nJD2HvFI93o=;
        b=JJHFe9Cerhvf5Fm0CI8TLWKRh3ydvyrUZRF34pAbHAiHGXTeRrcirjZBvcCoeeL/Uv
         I1ExvHahibwUJxxq77xlYI8QwOUMeV7V9BjC28GXGFDw7XZv/HGdrSj8TzDgbFDK+sIB
         G5NDdSQoHP1OVkkS7P+t4foTv5CvmQQZ5BoI+C/q8MJpDO1f5Nc+bFqCN3xwo3SURwmF
         d+Q/bcBbOvZDJWYeTaMyDKAJAiu11/+N6Y1PMIMTePSMMf3kruTSJPbxHYMF6Zhr6uUp
         jrUxWbkNeFHmADdlMfBuHiRc9DQkZ8BSi4C3ZNUvse1lFisItZh9TwqjgsISNmbyEk0B
         X44g==
X-Gm-Message-State: APuU4Z8t84CDXYUwcgHu4RorHT3nqCsPPOZkgGwbqeVeNbXj5KtauMG2
	e6CfJU035Wh3d+XXxKy1ldlS4TfGHyVN+F9zNsoFbuh9/pCKc3e3c+OIgRvw8niJe3S899vaaI1
	9dFVTVB4=
X-Gm-Gg: AZFdTZdvm5aBwGpzC2m+bl4INu64QiAhuALsfnFLFdSfo9u6YDcQwzVFFy37pFfsp3n
	NJ0Kpx8OdoKOL9iDximx7y7RdXluFC+dMiHjQm8WBk78nF+Gz5s72QAHJVdaHK9ursL2C76w8Yj
	anXFL9Ye7ge1Mbznc/HG61QMT4yM3MiqxJFKdsfoXqYg0DXd/lFRDfawlgTFVtqmqPiNOaLa7uQ
	c/6eveiThRoVlhRuqw7D5V/uZvq7ndqFdAL2UEXv4aBICJuvpiMhEMmjrGtCqejJJ8pLfIXc7b6
	Tv7AMtnKIoMZe6zEINXjcO7irRZQXVMShgfiujcUhtANqqTaqhRfoVi9125/K1ehpr2xb7JkHoN
	C0DUbzL5BkqBGtRWxhyhiUwSMNveoRiQpkyR8jJw/0trHYpdGZ12umQpJWKNJ4V7+WzTsJ0wczy
	Crh1D1TVR+amTMpx/GEvykzEpkaonx3v6xtEM4dbduyopLU2AgNKXiZNd7oO048rUX2d9SX0wRJ
	jIUICBLgh860mU2SpTOSRcyXwLCJQiozXp7Yu8HKbaVJPqJAbDAbNiKwSamyEmqqlDJEVE8bxnV
	YTIbZD2vMyQghtneSU6ZiiP+RFbcLGxR70ZIUawlsq4/YUbuL2MlsaVIT+ZlxdXZ3D95neB1dX3
	TLaaNFKxitoKHFBGcGqui7r8l
X-Received: by 2002:a17:907:948a:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c513ab42e45mr806770266b.35.1795389042896;
        Sun, 22 Nov 2026 15:10:42 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc2b0sm4472214a12.24.2026.11.22.15.10.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 15:10:42 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c516a574bffso101267266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:10:42 -0800 (PST)
X-Received: by 2002:a17:906:3d21:b0:c51:24a4:1dfb with SMTP id
 a640c23a62f3a-c513ac7edecmr563144766b.40.1795389041218; Sun, 22 Nov 2026
 15:10:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Nov 2026 15:10:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whoWAg2v66srqX2aSiRC_enSyxv96pkcSpR1WtVnX5DXg@mail.gmail.com>
X-Gm-Features: Aa3M54qkVygT4bVMtg8Ugghdpj5lYJwlNe3NnrI83oiuL5PEBJ_lmUYeHHJ0l6Q
Message-ID: <CAHk-=whoWAg2v66srqX2aSiRC_enSyxv96pkcSpR1WtVnX5DXg@mail.gmail.com>
Subject: Linux 7.4-rc4
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's Sunday afternoon, and -rc4 is out.

It's huge. What a surprise. Lots of little fixes all over, with
drivers being pretty exactly half of it (gpu and networking showing up
as usual, but there's usb, iio, nvme, sound.. you name it).

The rest is all over: core kernel, mm, filesystems, networking,
selftests, architecture updates. Would I have loved to see a smaller
rc? Sure. But those days are behind us, particularly with this very
large 7.4 release.

Please do keep testing,

             Linus

---

Abdulla Bubshait (1):
      drm/amd/display: Abort DPMS ON when enabling the link fails

Abhijit Gangurde (1):
      RDMA/ionic: Use a linear QID space when udma_shift is zero

Adethya Srinivasan (2):
      bpf: Reject writable map iterators on read-only maps
      selftests/bpf: Check writable iterator attach to a read-only array

Adolfo Morales Tena (1):
      ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ

Adrian Betschart (1):
      drm/amd/display: Apply the HDMI RGB range default only to HDMI signal=
s

Adrian Schlegel (1):
      x86/mce: Do not treat cache hierarchy errors as memory errors

Aldo Ariel Panzardo (3):
      drm/vmwgfx: return an error when a shared GB surface has no backup bu=
ffer
      drm/vmwgfx: close TOCTOU on guest_memory_bo in surface reference ioct=
l
      drm/vmwgfx: do not hand the embedded sg_table to the PRIME core

Aleksandr Loktionov (1):
      i40e: avoid resetting BQL state when freeing temporary Tx rings
in set_ringparam

Alex Elder (1):
      mailmap: add an alias for Alex Elder

Alex Kazinsky (1):
      blk-iocost: Fix overflow in donation weight calculation

Alexander Sarmanow (1):
      iio: light: vcnl4035: Fix reversed ALS mode bit

Alexandre Becholey (1):
      gpio: ljca: Validate the pin index of interrupt events

Alexandre Mergnat (1):
      regulator: mt6363: Serialize BUCK_TOP key access

Alexei Starovoitov (7):
      bpf, sockmap: Don't let an SK_PASS verdict cover the next message
      bpf, sockmap: Subtract all dropped bytes from the return value
      net: Leave sk_stream_wait_memory() once the socket is dead
      bpf, sockmap: Clear the redirect target before the sk_msg prog runs
      bpf, sockmap: Check that the redirected message is the cork
      bpf, sockmap: Keep the rest of the cork after a redirect
      bpf, sockmap: Clear the end mark of elements added by push and pop

Alexey Charkov (1):
      net: via-rhine: Stop the NIC on platform device shutdown

Alexis Bouzigues (2):
      iio: accel: adxl345: select IIO_BUFFER and IIO_KFIFO_BUF
      iio: accel: adxl313: add missing buffer selections in Kconfig

Ali Ahmet Memi=C5=9F (1):
      usb: typec: ucsi: debugfs: Fix GET commands on UCSI < 2.0

Ali Tariq (2):
      net: spacemit: Fix TX timeout work deadlocking on itself
      net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()

Alice Ryhl (2):
      rust_binder: push BR_TRANSACTION_COMPLETE before BR_FAILED_REPLY
      kbuild: rust: disable function merging unconditionally

Alison Schofield (2):
      cxl/region: Reject a repeat write of an endpoint decoder to targetN
      cxl/test: Free the decoder registry when cxl_test_init() fails

Allen Pan (1):
      drm/amd/display: Update DCN42B stutter latency to match DCN42

Amaan Cheval (2):
      gve: refuse XDP on queue formats without XDP support
      gve: fix RX page refcount overflow from INT_MAX pagecnt_bias

Amir Abudubai (1):
      Bluetooth: L2CAP: Fix size check for receive buffer space

Amit Machhiwal (2):
      KVM: PPC: Book3S HV: Disable preemption around host-side HPT lock use=
rs
      ring-buffer: Do not check si_mem_available() before deferred
init completes

Andrea Amer (1):
      iio: afe: rescale: expose offset if rescaler or source has one

Andrea Cervesato (1):
      MAINTAINERS: update Andrea Cervesato's email for LTP

Andreas Kemnade (1):
      drm/omap: dss: fix handling deferrals

Andrew Morton (1):
      mm/mempolicy: use one node set for interleave weights

Andrew Stellman (1):
      nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs

Andrey Misiurov (1):
      drm/radeon: Bound GPIO I2C table entry count from VBIOS

Anthony Pighin (1):
      net: gianfar: clear the pending Rx skb when freeing the Rx ring

Antonio Borneo (3):
      watchdog: stm32_iwdg: set driver data before requesting interrupt
      watchdog: stm32_iwdg: serialize accesses to EWCR register
      watchdog: stm32_iwdg: use managed variant of dev_pm_set_wake_irq()

Antonio V=C3=A1zquez Blanco (1):
      mei: me: add ice lake point LP iTouch DID

Ard Biesheuvel (3):
      lib/crc: Don't include <linux/types.h> in NEON intrinsics code
      xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
      arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h

Aristeu Rozanski (1):
      EDAC/i5000: Fix slot number passed to determine_mtr()

Arka Mondal (2):
      dt-bindings: iio: dac: adi,ad5758: Fix the 4 mA to 20 mA current rang=
e
      iio: dac: ad5758: Fix the 4 mA to 20 mA current range

Arnaldo Carvalho de Melo (8):
      tools headers UAPI: Sync linux/if_addr.h with the kernel sources
      tools arch x86: Sync the cpufeatures.h copy with the kernel sources
      tools arch x86: Sync the msr-index.h copy with the kernel sources
      tools headers: Sync UAPI sound/asound.h with the kernel sources
      perf trace beauty: Split the KVM ioctl table by direction
      tools headers: Sync KVM headers with the kernel sources
      tools headers: Sync linux/gfp_types.h with the kernel sources
      perf tools: Fix the sync-headers generated commit messages

Arnav Kapoor (9):
      iio: imu: inv_mpu6050: fix magnetometer scale of Y and Z axes
      iio: imu: inv_mpu6050: fix swapped accel and gyro startup times
      iio: common: scmi_sensors: fix truncating 64-bit divisions
      iio: common: cros_ec_sensors: use sensor_scale union member for CALIB=
SCALE
      iio: proximity: sx9324: fix out-of-bounds read of scan period table
      iio: adc: mcp3564: reject devices without match data
      iio: proximity: sx9360: fix sampling frequency write and available ra=
nge
      iio: proximity: sx9500: ignore event config writes that don't change =
state
      ALSA: hda/realtek: Don't apply the Legion Slim 7 quirk to Lenovo
V14 G2 ITL

Arnd Bergmann (1):
      net: kunit: move struct net_devmem_dmabuf_binding off stack

Arun Iyengar (1):
      net: stmmac: drop the rest of the frame when napi_build_skb() fails

Arvind Yadav (1):
      drm/xe/irq: Always free requested IRQs on uninstall

Austin Zheng (1):
      drm/amd/display: Flip
dml2_core_utils_get_segment_horizontal_contiguous() Inputs

Aveline Noir (1):
      mm/damon/core: reset watermark wait state on each iteration

Avi Weiss (2):
      nvme-tcp: wait for in-flight TLS handshake callback
      net: ena: avoid double-counting TX DMA mappings on failure

Axel Mierczuk (2):
      ipvs: validate cport in received sync records
      ipvs: skip cport 0 connections in ip_vs_conn_out_get()

Baek Kyu, Kim (3):
      iio: dac: mcp4725: Update the cached DAC value only on success
      pinctrl: realtek: Write the encoded slew rate value
      tracing: Free tracer resources on instance creation failure

Bartosz Golaszewski (7):
      gpiolib: don't overwrite the entire flags field in gpiod_get_directio=
n()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: clear debounce period before the "requested" flag
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit(=
)
      gpio: cdev: don't overwrite the whole flags field when configuring li=
nes
      gpiolib: keep the line state workqueue alive until device release
      gpio: shared-proxy: propagate -ENOTSUPP from .set_config()

Beat M. Liechti (1):
      mailmap: add entry for Beat M. Liechti

Ben Cressey (1):
      arm64: kexec: use a typed entry to fix kCFI oops

Ben Grisdale (1):
      regulator: tps65132: Fix incorrect bits for VNEG/VPOS discharge

Benjamin Cheng (2):
      drm/amdgpu: wait for tlb flush before freeing BO
      drm/amdgpu/gem: use dma_resv_add_fence directly

Billy Tsai (2):
      dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
      iio: adc: aspeed: Use syscon phandle for trimming data when available

Bo Cao (1):
      bpf, sockmap: Fix ring capacity invariant break in bpf_msg_push_data(=
)

Boyan Liu (1):
      scsi: sd_zbc: Cap zone report count by buffer size

Bradley Morgan (2):
      powerpc32/modules: Reserve a PLT entry for ftrace_regs_caller
      mailmap: update email address for Bradley Morgan

Breno Leitao (2):
      bpf: Report RCU-tasks quiescent states in do_check()
      fgraph: Do not mark index 0 in every shadow stack frame

Brian Ellis (1):
      usb: gadget: u_serial: fix NULL deref in gs_close() after failed open

Brian Norris (2):
      tracing: Properly match strings that start with numbers
      tracing: Add tests for globbing number-based strings

Carlos Song (1):
      spi: fsl-lpspi: expand FCR TWATER and RXWATER bit fields to 4 bits

Cen Zhang (7):
      Bluetooth: hci_conn: Initialize the device before hash insertion
      Bluetooth: vhci: Flush suspend work after removing debugfs
      Bluetooth: vhci: Serialize packet reception with device creation
      Bluetooth: L2CAP: Protect the receive reject-list lookup
      ocfs2: serialize inode journal access with shutdown
      ocfs2/dlmfs: keep the superblock alive during lock work
      ocfs2: advance locking_state through the live cursor

Chandrashekar Devegowda (1):
      Bluetooth: btintel_pcie: Fix SCP DBGC base address

Changyul Lee (2):
      iio: trigger: free the trigger ID after device_del()
      net/mlx5e: Hold sync_lock while resetting VXLAN ports

Chaosheng Qu (1):
      tracing/osnoise: Don't start a kthread in timerlat user-space mode

Chaoyi Chen (1):
      accel/rocket: Fix the extra iommu_group_get call in rocket_job_handle=
_irq

Chaz Bailey (1):
      usb: typec: nb7vpq904m: Set client data in probe to avoid crash on re=
move

Chen Yuxi (1):
      ASoC: wm8962: Fix broken headset button caused by wrong guard constan=
t

Cheng Yongkang (2):
      io_uring/timeout: don't rearm a multishot timeout on cancel
      io_uring/rsrc: keep the old file when a file update fails

Chris J Arges (1):
      net: prevent receive header offset overflow during decapsulation

Chris Mason (22):
      vt: serialise the producers of the flip buffer
      bpf, sockmap: Give no progs to a TCP listener
      bpf, sockmap: Check the target of an egress redirect before each send
      bpf, sockmap: Check the TCP state in recvmsg()
      bpf, sockmap: Reset the copy position when corking
      bpf, sockmap: Don't copy 0 bytes into a full cork
      xfs: don't skip the flush before shifting extents
      xfs: flush the shifted range before changing the file
      xfs: don't change the block map under a dirty folio
      iomap: don't punch delalloc under a dirty EOF block
      xfs: test for reflink after the dio write checks
      xfs: test for always COW after the dio write checks
      xfs: refuse fallocate racing with realtime flag changes
      xfs: take the MMAPLOCK in xfs_fileattr_set()
      xfs: restart faults racing with realtime flag changes
      xfs: don't enable DAX on zoned inodes
      xfs: test for realtime and reflink under the pNFS locks
      tcp: don't let __tcp_set_rto() return 0
      tcp: clamp RTT samples in tcp_rtt_estimator()
      tcp: reject RTT samples from TSecr above 120 s
      tcp: clamp the samples in tcp_rcv_rtt_update()
      tcp: bound the rto_min of a route in tcp_rto_min()

Christian Aurich Zanettini Martins (1):
      ring-buffer: Do not WARN when trace_rb_cpu_prepare() fails to allocat=
e

Christian K=C3=B6nig (1):
      drm/amdgpu: fix cleared PDE/PTE flag generation

Christian Loehle (1):
      ACPI: CPPC: Reject EPP registers narrower than 8 bits

Christian Schmidbauer (3):
      net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
      net: stmmac: dwmac1000: don't discard frames with only a checksum err=
or
      net: stmmac: dwmac1000: stop hardware from dropping checksum-error pa=
ckets

Christian Zigotzky A-EON Open Source (1):
      powerpc/pasemi: Defer Nemo IRQ initialization

Christoph Hellwig (2):
      xfs: always call xfs_update_stable_writes in xfs_ioctl_setattr_xflags
      xfs: refuse writes to files racing with realtime inode flag changes

Christopher Hoover (2):
      iio: temperature: hid-sensor-temperature: Use per-instance callbacks
      iio: humidity: hid-sensor-humidity: Use per-instance callbacks

Chun-Yi Lee (1):
      Bluetooth: SMP: Fail if local and remote public key X coords match

Ciro Iriarte (1):
      scsi: target: core: Parse APTPL res_type and res_scope as hex

Cl=C3=A9ment Le Goffic (3):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled

Cl=C3=A9ment L=C3=A9ger (1):
      riscv: kgdb: Fix potential missing local_irq_restore() call

Cooper Morgan (2):
      drm/amd/display: Saturate refresh rates in v1/v2 FreeSync infopackets
      drm/amd/display: Use FreeSync v3 infopacket for sinks above 255 Hz

Cosmin Tanislav (1):
      usb: gadget: f_ncm: restart the TX timer if the TX freelist is empty

Cunhao Lu (1):
      MAINTAINERS: exclude CAN documentation from general networking

Daejun Park (2):
      xfs: break layouts before swapping extents
      xfs: wait for direct I/O before swapping extents

Dan Carpenter (1):
      drm/vmwgfx: Fix NULL vs error pointer bug in vmw_prime_import_sg_tabl=
e()

Daniel Machon (2):
      net: sparx5: fix RX ring stall on frames from inactive ports
      net: lan969x: fix RX ring stall on frames from inactive ports

Daniel Schaefer (1):
      iio: light: hid-sensor-als: Don't read past the end of short fields

Daniel Wade (1):
      net: bridge: fix skb leak of reinjected link-local frames

Darong Lu (1):
      ipvs: wait grace period before reusing destinations

Dave Jiang (1):
      nvdimm/namespace: Nest mapping locks under the bus lock

Davey Hughes (1):
      drm/amd/display: Keep FreeSync flip timing across plane resets

David Carlier (5):
      iio: dac: mcp47feb02: reject out-of-range raw values
      tracing: Define common event fields before enabling boot events
      tracing: Drop the synthetic event ref when clearing hist triggers
      tracing/user_events: Don't free an event that a dynamic event
still references
      tracing: Ignore .function on the function trace event

David Hildenbrand (Arm) (11):
      mm/khugepaged: don't map folios that are not uptodate in MADV_COLLAPS=
E
      mm/memory-failure: fix folio refcount leak and
min_order_for_split() locking
      mm/memfd: handle GUP pins more reliably when write-sealing
      mm/userfaultfd: fix PTE table overruns in UFFDIO_MOVE
      mm/rmap: fix PTE table overruns during batched unmap
      mm/rmap: fix PTE table overruns during batched reference checks
      mm: limit pagecache folio refcount when mapping pages
      mm: limit pagecache folio refcount when splicing into pipes
      mm/mmu_gather: flush pending references early before the folio limit
      iommufd: fix cleanup when adding memfd folio pins fails
      mm/gup: limit pagecache folio refcount when grabbing references

David Thompson (1):
      gpio: mlxbf2: Disable interrupts around the chip lock in direction op=
s

Davidlohr Bueso (1):
      cxl/region: Restore a target's position from its slot after sorting

Deep Shah (1):
      RDMA/siw: Fix use-after-free in siw_mem_id2obj()

Devin Christensen (1):
      ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animatio=
n

Dezhen Lu (1):
      RDMA/mlx5: Fix DevX umem page size truncation for pages >=3D 4G

Ding Feng (1):
      zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in zonefs_write_check_lim=
its()

Dirk Su (1):
      ALSA: hda/realtek: Add LED fixup for HP ZBook Ultra G1a Laptops

Dmitry Bogdanov (2):
      scsi: Revert "scsi: target: iscsi: Fix hang for aborted
WRITE_PENDING commands"
      scsi: target: iscsi: Fix hanging WRITE_PENDING commands

Dmitry Safonov (1):
      perf build: Override OUTPUT when building internal libraries

Dmitry Torokhov (1):
      Input: destroy force-feedback device on input unregistration

Dnyaneshwar Bhadane (2):
      drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components
      drm/xe/hwmon: Report errors using structured xe_log API

Dongdong Hao (1):
      scsi: leapraid: Fix init_cmd_priv error handling

Donghui Zhao (1):
      MAINTAINERS: Add Donghui Zhao as ESWIN PCIe maintainer

Dustin Tacy (1):
      ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15t-ek000

Egor Perevoshchikov (1):
      drm/amd/display: Restore PSR-SU guard in power module

Emil Tsalapatis (1):
      bpf: Use dedicated workqueue for freeing BPF programs

Erhan Bilgili (1):
      drm/amdgpu: Fix UserQ slot availability checks

Eric Biggers (1):
      fscrypt: Initialize ->ci_master_key before publication

Eric Dumazet (6):
      tcp: purge Fast Open RST queue when listen() fails
      ipv6: gro: limit the number of extension headers
      ipv6: mcast: use skb_set_transport_header_careful() in
ipv6_mc_check_exthdrs()
      net: openvswitch: use skb_set_transport_header_careful() in
parse_ipv6hdr()
      sctp: use skb_set_transport_header_careful() in sctp_v6_err()
      udp: use skb_set_transport_header_careful() in __udp6_lib_err_encap()

Eric Sandeen (1):
      xfs: properly order xfsstats proc/sysfs init and teardown

Fangzhi Zuo (2):
      drm/amd/display: Move HDMI FRL Polling Outside dc_lock
      drm/amd/display: Stop HDMI FRL status polling on fini

Fei Yu (1):
      drm/syncobj: Limit the number of handles and use kvmalloc for
user-sized arrays

Filip Balluch (1):
      i40e: fix freeing of TX rings on RX allocation failure

Fredric Cover (1):
      smb: client: convert path_consumed to mount charset units

Fr=C3=A9d=C3=A9ric Mah=C3=A9 (1):
      riscv: defconfig: enable onboard USB hub support

Gal Pressman (1):
      net/mlx5e: Fix XSK pool corruption when switching channels

Gaurav Suman (1):
      ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the cod=
ec

Gaurav Yadav (1):
      KVM: PPC: BookE: Use vcpu_err() instead of printk() in kvmppc_dump_vc=
pu()

Gautam Menghani (6):
      KVM: PPC: Book3S HV: Ensure that calls to idr_alloc are synchronized
      KVM: PPC: Book3S HV: XICS: Update irq_type for cleanup to work
      KVM: PPC: Book3S HV: XICS: Avoid NULL ptr deref in
kvmppc_xive_cleanup_vcpu()
      KVM: PPC: Book3S HV: Take SRCU read lock around kvmppc_h_page_init() =
call
      KVM: PPC: Book3S HV: Avoid spurious interrupts caused by LPCR_MER bit
      KVM: PPC: Book3S HV: Use u8 to store guest's interrupt priorities

Geert Uytterhoeven (1):
      riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Add always_set_rate quirk for Yamaha MODX M

Gerald Schaefer (1):
      s390/appldata: Fix error handling in appldata_generic_handler()

Gu Bin (2):
      perf hist: Fix branch_info index for sample weight
      tools: gpio: gpio-watch: do not clobber errno on read error

Guangshuo Li (4):
      iio: accel: kxsd9: Fix potential use-after-free on removal
      misc: bcm-vk: fix DMA allocation memory leak
      accel/rocket: put IOMMU domain on BO creation failure
      zonefs: check multiplication overflow in zonefs_fname_to_fno()

Guenter Roeck (12):
      hwmon: Use per-device lockdep keys
      hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
      hwmon: (nct6775) Fix swapped temperature tolerance register writes
      hwmon: (nct6775) Fix tolerance bitmask when reading REG_FAN_MODE
      watchdog: core: Clear wd_data pointer on errors
      watchdog: core: Add missing locks
      watchdog: core: Prevent ping worker from re-arming timer on suspend
      watchdog: core: Stop pretimeout hrtimer on suspend
      watchdog: core: Restore WDOG_HW_RUNNING if stopping watchdog fails
      watchdog: core: Cancel timer if cdev_device_add() fails
      watchdog: core: Fix unbalanced module_put() in watchdog_open()
      watchdog: core: Update last_keepalive in watchdog_start()

Guilherme Giacomo Simoes (1):
      nbd: Reclassify sockets in the reconnect path

Guixin Liu (10):
      nvme-pci: remove write-only NVMEQ_DELETE_ERROR flag
      nvme-fc: remove dead seqno field in nvme_fc_queue
      nvme-auth: remove dead entry field in nvme_dhchap_queue_context
      nvme-fabrics: remove dead hostnqn already-assigned check
      nvme: drop unreachable "off" case in reconnect_delay_show()
      nvmet-fc: remove dead fields in nvmet_fc_ls_iod and nvmet_fc_tgt_queu=
e
      nvmet: remove unreachable "pcie" entry from the address family map
      nvmet: passthru: remove unreachable break statements
      nvmet-pci-epf: don't drain the never-populated SQ list
      nvmet: use GFP_KERNEL for PR allocations

Guobin Zhang (1):
      riscv: signal: protect regs->status RMW from concurrent preemption

Guodong Xu (1):
      mailmap: update entry for Guodong Xu

Gyeyoung Baek (1):
      accel/rocket: Fix drm_mm UAF on close vs in-flight job

G=C3=BCnther Noack (5):
      landlock: Fix layer composition of LANDLOCK_ACCESS_FS_REFER
      landlock: Add KUnit test for landlock_get_fs_access_mask()
      selftests/landlock: Test that layering does not break refer
      landlock: Simplify landlock_get_fs_access_mask()
      landlock: Clarify implicit handling of LANDLOCK_ACCESS_FS_REFER

Haishuang Yan (1):
      virtio_net: Disable AF_XDP pools on queues above curr_queue_pairs

Hangbin Liu (1):
      ipv6: ioam6: do not modify shared tuninfo eh.nexthdr

Hanson Wang (1):
      drm/i915/dsb: Realign GOSUB only for QW slots 6 and 7

Haoming Gao (1):
      accel/rocket: publish read fences for input buffers

Haowen Tu (1):
      Input: max77693-haptic - disable bias on failed open

Haoxiang Li (1):
      KVM: PPC: Book3S HV: Clean up on uvmem initialization failure

Heiko Carstens (1):
      s390/syscall: Set -ENOSYS return value before calling
syscall_enter_from_user_mode_work()

Heiko Stuebner (1):
      MAINTAINERS: Add two reviewers to the Rockchip DRM entry

Hengyu Liang (3):
      xfs: fix f_bfree underflow in statfs()
      neighbour: do not update an existing proxy entry on SIOCSARP
      fuse: preserve ENOTCONN after failed initialization and disconnect

Henry Martin (3):
      bpf: Fix verifier model mismatch on __sk_buff.remote_port narrow read
      sctp: fix skb_over_panic when adding addresses with a pending
delete of another family
      ip6mr: prevent info-leak in ip6mr_cache_report()

Henry Zhang (2):
      drm/vc4: dsi: Register the PHY clock provider with devm
      drm/vc4: dsi: Set the transfer result before completing the transfer

Hex Lindqvist (1):
      Bluetooth: btintel: Don't log unsupported debug features as an error

Hugo Sales (3):
      drm/amd/display: Take every stream out of self-refresh before a modes=
et
      drm/amd/display: Add the AUX backlight minimum once on the custom cur=
ve
      drm/amd/display: Hold the VRR vblank reference only on active CRTCs

Hui Peng (1):
      USB: serial: garmin_gps: validate packet data length in nat_receive()

Hungyu Lin (1):
      fuse: clear the old EOF tail before writeback-cache writes

HyeongJun An (1):
      MAINTAINERS: Add myself as a reviewer for the virtual PCM test driver

Hyunjung Ko (1):
      gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes

Hyunwoo Kim (1):
      tcp: fix NULL pointer dereference when restarting a Fast Open listene=
r

Ian Abbott (1):
      comedi: comedi_bond: Fix leak of opened device references

Ian Forbes (2):
      drm/vmwgfx: Never destroy STDU zero's Screen Target
      drm/vmwgfx: Check whether CRTC is active when updating planes

Ian Rogers (3):
      tools build: Add explicitly sequenced -lzstd to libbfd feature fallba=
ck
      perf build: Add explicitly sequenced -lzstd to libbfd feature fallbac=
k
      perf jevents: Don't encode MSRs with no value

Igor Paunovic (3):
      accel/rocket: release the shared device's devres on teardown
      accel/rocket: number the cores by devicetree position, not bind order
      accel/rocket: request the core clocks by name

Ihor Urazov (1):
      usb: typec: ucsi: acpi: Assume UCSI 1.0 on HP ZBook 8 G2i 14

Ivan Verbovoy (1):
      Input: da7280 - do not advertise FF_GAIN

Jackie Liu (1):
      drm/amd/display: Fix logger leak on perf trace allocation failure

Jacob Moroni (6):
      RDMA/irdma: Fix FRWR logic for PAGE_SIZE > 4K
      RDMA/irdma: Fix paged PBLE and virtual AEQ for PAGE_SIZE > 4K
      RDMA/mlx4: Fix stale umem and MTT state after rereg_mr failures
      RDMA/irdma: Do not allow rereg_mr to revive defunct MRs
      RDMA/irdma: Do not change mr->pd in driver during rereg_mr
      MAINTAINERS: Add Jacob Moroni as irdma co-maintainer

Jacob Riff (1):
      usb: typec: ucsi: retry init only while the PPM is not ready

Jaewon Jung (2):
      tracing: Keep copying markers when one instance is stopped
      tracing: Avoid undefined shifts for zero histogram map size

Jaeyeong Lee (3):
      RDMA/rtrs: Register client event handler after capability check
      drm/vmwgfx: Erase the detached resource entry on resource release
      net/tls: serialize context removal in tls_device_down()

James Clark (2):
      perf test probe_vfs_getname: Fix missing debuginfo detection
      perf test: Don't starve per-process tests with system-wide events

James Houghton (1):
      scsi: bsg: Don't copy sense data to user memory when canceled

Jan Remes (1):
      iio: light: tsl2591: don't divide by zero

Jean-Baptiste Maneyrol (3):
      iio: inv_sensors: prevent timestamps going back in time in transition=
s
      iio: inv_sensors: do not compute period estimation when updating odr
      iio: imu: inv_icm42600: fix parsing of all FIFO frames for odr change

Jens Axboe (2):
      io_uring: don't run canceled local work from a foreign mm on release
      io_uring/io-wq: show stuck workers rather than WARN on a slow exit

Jens Emil Schulz =C3=98stergaard (2):
      pinctrl: ocelot: use a raw spinlock for the GPIO regmap
      pinctrl: ocelot: do not use the chained irqchip behind a sleeping bus

Jeremy Dean Clifton (3):
      Bluetooth: hci_conn: Free the unset handle when adding a connection f=
ails
      Bluetooth: hci_conn: Refuse new connections once HCI_UP is cleared
      Bluetooth: hci_sync: Disable connection works before draining

Jernej Skrabec (1):
      regulator: axp20x: AXP313A: set ramp_delay

Jesse Zhang (2):
      drm/amdkfd: don't check the HMM range when getting its pages failed
      drm/amdkfd: keep the DMA addresses of a range intact if splitting fai=
ls

Jiale Yao (5):
      iio: gyro: bmg160: reject duplicate event disable
      iio: imu: kmx61: reject duplicate event disable
      misc: ibmvmc: initialize HMC state before device registration
      s390/dcssblk: Initialize device semaphore before sysfs registration
      powerpc/eeh: NUL-terminate force recovery input

Jiaming Fan (3):
      drm/radeon: only unregister the ATPX handler if we registered it
      drm/amdgpu: only unregister the ATPX handler if we registered it
      drm/amdgpu: unwind module init on failure

Jianqiang Zou (1):
      fbdev: radeonfb: reject a zero pixclock in radeonfb_check_var()

Jiawen Liu (1):
      gpio: omap: handle debounce clock preparation failure

Jiaxing Hu (3):
      accel/rocket: take the completion register writes under job_lock
      accel/rocket: wait for a running IRQ handler before resetting a core
      accel/rocket: let the core suspend after a reset

Jiayuan Chen (1):
      selftests/bpf: Fix bpf-gcc CO-RE relocation in verifier_sockmap_mutat=
e

Jing Zhou (1):
      drm/amd/display: Seed boot clocks to avoid lowering pre-OS display cl=
ocks

Jiri Olsa (2):
      bpf: Restrict uprobe ctx writes to the registers ptrace can set
      selftests/bpf: Test which ctx registers a uprobe prog can write

Jiri Slaby (SUSE) (3):
      serial: 8250_exar: check priv->gpio properly
      serial: 8250_hp300: reorder HPDCA code
      tty: fix misapplied compat_ptr() in tty_compat_ioctl()

Joas Antonio dos Santos (5):
      hugetlbfs: move hugetlbfs_free_inode tracepoint to ->destroy_inode()
      Bluetooth: hci_qca: clear qca_memdump when discarding dump packets
      Bluetooth: L2CAP: validate MPS and MTU in ECRED connection response
      net: usb: smsc75xx: reject frames without a full header and FCS
      mac802154: llsec: reject secured frames with security level 0

Joe Perches (1):
      MAINTAINERS: DRM DRIVERS AND MISC GPU PATCHES

Joel Granados (1):
      sysctl: Do jiffy / ms conversion in ulong space

Johan Hovold (10):
      USB: cdc-acm: fix NULL-deref on hangup
      USB: serial: upd78f0730: fix NULL-deref on hangup
      USB: serial: io_edgeport: fix NULL-deref on early status
      USB: serial: io_edgeport: fix potential close() use-after-free
      USB: serial: io_edgeport: fix potential NULL-deref at open
      USB: serial: io_edgeport: move initial termios update to open()
      USB: serial: io_edgeport: fix potential fifo corruption
      USB: serial: io_edgeport: fix potential use-after-free on disconnect
      USB: serial: io_edgeport: serialise MCR accesses
      USB: serial: garmin_gps: fix deadlock on reset request

Joonhoe Kim (3):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
      usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes
      scsi: ufs: qcom: Reprogram ESI after a host controller reset

Jose Fernandez (Anthropic) (1):
      mm/filemap: stop fault-around when the walk steps back

Josef Bacik (35):
      thunderbolt: stream: Undo more if the start fails
      USB: serial: oti6858: fix the teardown order in close
      iio: sx9310: use the data of the I2C table
      iio: addac: ad74413r: fix the values of set_multiple
      iio: adc: ad7923: add the AD7927 to the SPI ID table
      iio: adc: check the result of ad_sd_init()
      iio: accel: adxl380: don't stay in standby on -EINVAL
      serial: core: respect runtime PM when sending x_char
      serial: 8250_lpss: don't divide by 0 above 6.25 Mbaud
      serial: 8250_mxpcie: handle hangup during break
      serial: fsl_lpuart: fix tty ref of wakeup event
      serial: imx: fix the tty reference of the wakeup event
      serial: rda: free the interrupt on shutdown
      serial: samsung: don't leak the tty on an RX IRQ
      serial: samsung: put the previous baud clock
      comedi: fix endless recursion in comedi_event()
      comedi: addi_apci_1500: fix clearing of the gate enable
      comedi: ni_660x: don't poll without a DMA channel
      comedi: ni_tio: Fix overflow of the clock period
      comedi: vmk80xx: report failed transfers of the K8061
      misc: vmw_vmci: wait for callbacks in event unsubscribe
      w1: use the bus mutex for the "rw" file
      w1: remove the master's files before taking its locks
      w1: ds2482: set the strong pull-up with its byte
      w1: ds28e04: use the bus mutex to talk on the bus
      w1: ds2805: use the bus mutex to talk on the bus
      w1: netlink: drop the slave after the bus is unlocked
      w1: don't hold list_mutex while a slave is torn down
      w1: w1_therm: lock the list of slaves for the bulk read
      w1: w1_therm: leave the slaves of other families alone
      mei: lb: read the MTU once
      bpf, sockmap: Write sg.start when recvmsg() faults
      bpf, sockmap: Don't let an SK_DROP verdict stick
      bpf, sockmap: Clear the resume state of a stopped psock
      iio: hid-sensors: fix a division by zero

Josh Klecka (1):
      ALSA: hda/realtek: Add mute LED support for HP Pavillion Aero 13-be1x=
xx

Joshua Horne (1):
      drm/amd/pm: send smu8 sclk level indices, not the level mask

Juan Agustin Niccolini (2):
      tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
      selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c

Juan Parrado (2):
      Input: xpad - add support to Hori Real Arcade Pro 4
      Input: xpad.c - add support for Hyperkin Xenon, Hori Taiko
Controller DX, and 8BitDo M30

Julian Anastasov (5):
      ipvs: fix problems during connection deletion
      ipvs: update flags and seqs in backup server under lock
      ipvs: read flags and seqs in master atomically
      ipvs: honor the overload state and do not enter it forever
      ipvs: do not create conns from packets with port 0

Julius Bairaktaris (3):
      ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buff=
er
      ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buff=
er
      net: make room for the tunnel header in skb_segment_list()

Junyoung Jang (1):
      fuse: skip dcache instantiation for readdirplus names with embedded N=
UL

Justinien Bouron (1):
      ata: libata-core: Add max sector quirk to INTEL SSDSCKKB240G8

K Prateek Nayak (1):
      sched/fair: Avoid transient double accounting for delayed tasks

Kalpesh Solanki (2):
      bonding: reject IEEE 802.15.4 and 6LoWPAN devices in bond_enslave
      tun: disallow setting ARPHRD_MCTP link type via TUNSETLINK

Karl Asseily (1):
      ASoC: es9039q2m: Enable the DAC clock at component probe

Karl Mehltretter (4):
      iio: trigger: Return an error when the trigger has no free irq
      parisc: irq: Trace hardirq state in do_cpu_irq_mask()
      parisc: Fix register corruption in 32-bit dynamic ftrace
      powerpc32/bpf: return false from bpf_jit_supports_fsession() on ppc32

Karol Wachowski (1):
      accel/ivpu: Defer recovery until probe completes

Karthik Poosa (1):
      drm/xe/hwmon: Propagate all hardware read errors

Keegan Freyhof (2):
      bnxt_en: Map HWRM_ERR_CODE_PF_UNAVAILABLE to -ECOMM
      bnxt_en: Wait for the PF in bnxt_resume()

Kent Russell (3):
      drm/amdgpu: Run shader cleaner on all XCCs on faults
      drm/amdgpu: Fix fault shader cleaner on MI3
      drm/amdgpu: Fix fault cleaner race condition

Kiwoong Kim (2):
      scsi: ufs: core: Skip ABORT TASK for device management commands
      scsi: ufs: mcq: Poll OCS after sq cleanup for device management comma=
nds

Konstantin Ryabitsev (2):
      get_maintainer: only use THE REST as a fallback
      docs: submitting-patches: make LKML a list of last resort again

Krystian Kaniewski (2):
      usb: gadget: u_serial: pin ports while TTYs are installed
      xarray: fix index jumping backwards in xas_find()

Krzysztof Kozlowski (1):
      riscv: dts: spacemit: k1: Correct missing space

Kuniyuki Iwashima (2):
      mm/kasan: detect double-free involving kfree_rcu_sheaf()
      mm/kasan/kunit: add double-free tests involving kfree_rcu_sheaf()

Kyle Smith (1):
      nvme: Fix potential gendisk leak in nvme_alloc_ns

Kyle Zeng (3):
      tracing: Restrict perf filters that read kernel strings
      tracing/filters: Treat zero-length dynamic strings as empty
      tracing: Validate user addresses in faultable buffer copies

Leo Yan (2):
      perf treport: Initialize the subtitle in the constructor
      perf timechart: Initialize Textual attributes in constructors

Leon Ming (1):
      fuse: set dentry epoch before making the dentry visible

Leon Romanovsky (4):
      RDMA: Rely on the generic Patchwork instance
      RDMA: Add missing UAPI files
      RDMA: Clean up the INFINIBAND subsystem entry
      RDMA: Remove pointless links

Li RongQing (3):
      perf kvm: Fix arm64 VM-exit duration accounting
      perf intel-pt: Free the old snapshot reference array after growing it
      perf intel-bts: Free the old snapshot reference array after growing i=
t

Liam R. Howlett (Google) (3):
      maple_tree: fix rcu reader NULL dereference after the tree is emptied
      maple_tree: test emptying tree while RCU reading
      maple_tree: update internal warning and bug_on code

Lianjie Wang (2):
      gpio: virtio: bound the line names block by its configured size
      gpio: virtio: compute the line names size in a size_t

Linus Torvalds (17):
      assoc_array: correct the documentation of get_key_chunk()'s level arg=
ument
      assoc_array: don't lose objects when a shortcut is split on a
word boundary
      assoc_array: don't lose objects when a root shortcut is split at leve=
l 4
      assoc_array: move in-place insertion into a function of its own
      assoc_array: fill the segment cache in one place
      assoc_array: move node splitting into a function of its own
      assoc_array: move shortcut creation into a function of its own
      assoc_array: choose between splitting a node and a shortcut without g=
otos
      assoc_array: don't chain a new shortcut onto an existing one
      assoc_array: keep gc's cleanup out of the live tree on allocation fai=
lure
      assoc_array: move gc's folding into a function of its own
      assoc_array: replace the labels in gc's tree walk with a loop
      assoc_array: move deletion's collapse into a function of its own
      assoc_array: find and collapse in deletion without gotos
      assoc_array: use assoc_array_parent_link() when splitting a shortcut
      wait-event: clean up the internal helper arguments
      Linux 7.4-rc4

Liu Chao (1):
      Input: goodix - reject a bak_ref length that cannot hold the checksum

Loic Poulain (1):
      iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for ADC_TM aux dev=
ice

Lorenzo Bianconi (1):
      net: stmmac: re-base EST after PTP settime64

Lorenzo Stoakes (ARM) (1):
      mm/vma: read anon_vma carefully in validate_mm()

Louis-Alexis Eyraud (1):
      ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error

Luigi Santivetti (1):
      drm/imagination: use appropriate poll function for non-iomem

Luiz Augusto von Dentz (1):
      Bluetooth: 6lowpan: Always consume the skb in chan_recv_cb

Luiz Capitulino (Red Hat) (2):
      powerpc/watchdog: disable watchdog when watchdog_thresh=3D0
      mailmap: add entries for Luiz Capitulino

Mahesh Salgaonkar (2):
      MAINTAINERS: Update EEH maintainer details
      MAINTAINERS: Update OCXL maintainer details

Mani Tofigh (4):
      mm, swap: stop cluster list scans once swapoff clears SWP_WRITEOK
      mm/shmem: fix swapin livelock on a mismatched large swap cache folio
      nvme: fix deadlock on nvme_subsystems_lock in nvme_init_subsystem()
      blk-mq: take quiesce_lock when removing a queue from the tag set

Marc Herrero (2):
      ASoC: qcom: audioreach: use a 32-bit container for S24_LE PCM
      ASoC: qcom: audioreach: only disconnect the route a mixer control own=
s

Marek Szyprowski (7):
      dma-coherent: serialize reserved memory pool initialization
      dma: swiotlb: Serialize restricted DMA pool initialization
      dma-pool: release CMA pages on atomic_pool_expand() error path
      dma: swiotlb: Round restricted DMA pool size down to IO_TLB_SEGSIZE
      dma: swiotlb: Properly tear down the default pool on exit
      dma-pool: decrypt pages before creating the shared remap
      riscv: mm: reserve the DTB before scanning reserved memory

Marek Vasut (1):
      ALSA: doc: cs35l56: Point to kernel.org firmware repository

Mario Limonciello (1):
      drm/amd: Select the firmware signing scheme the PSP reports

Markus Schneider-Pargmann (TI) (1):
      drm/tilcdc: Fix suspend/resume drvdata

Martin Belanger (3):
      nvme-tcp: use an aligned buffer for the TLS record type
      nvme-tcp: move the TLS record read loop into a helper
      nvme-tcp: consume TLS records without application data

Martin George (2):
      nvme-sysfs: use kfree_sensitive() for DH-HMAC-CHAP secrets
      nvme-fabrics: use kfree_sensitive() for the old DH-HMAC-CHAP secret

Marwan Mohamed Zein (1):
      rust: iov: fix return lifetime of `copy_from_iter_raw()`

Masami Hiramatsu (Google) (4):
      tracing/filters: Fix MATCH_END_ONLY regex matching for fixed-size str=
ings
      tracing/filters: Handle out-of-range CPU for OP_NE in cpumask compari=
son
      tracing/filters: Check for missing operand after operator in parse_pr=
ed()
      tracing/filters: Fix false success return in process_system_preds()

Mateusz Jo=C5=84czyk (1):
      net: phy: realtek: fix listing of sysfs directory tree

Mathias Nyman (1):
      xhci: keep port link_inactive and connected flags in sync when polled

Matt Turner (1):
      vgacon: Fall back to the dummy console if mapping VGA memory fails

Mauro Carvalho Chehab (1):
      mm: memory-failure: update statistics before emitting the trace event

Maxime Chevallier (1):
      net: stmmac: Clear DMA errors for multi-channel interrupts

Maxime Ripard (7):
      MAINTAINERS: Move armada DRM under drm-misc
      MAINTAINERS: Move Keem Bay DRM under drm-misc
      MAINTAINERS: Move Tegra DRM under drm-misc
      MAINTAINERS: Remove Jonas Karlman from bridge reviewers
      MAINTAINERS: Remove Andrzej Hajda from bridge maintainers
      MAINTAINERS: Remove myself for VC4 DRM driver
      MAINTAINERS: Add Dmitry Baryshkov as bridge maintainer

Maximilian Czirr (1):
      iio: hid-sensor: Fix scale for magnetic north heading

Ma=C3=ADra Canal (7):
      drm/vc4: Drop BO usecnt before releasing the old FB
      drm/vc4: Complete async page flips from an ordered workqueue
      drm/vc4: Look up the async page flip fence before committing the flip
      drm/vc4: Fix off-by-one in the shader record BO handle check
      drm/vc4: Check for a validated shader before reading its thread mode
      drm/vc4: Start shader code at varying offsets in its BO
      drm/vc4: Clear the slice caches before resetting a stalled GPU

Md Haris Iqbal (3):
      block: Reject unknown status tags in error injection rules
      block: allow error injection rules to delay bios
      Documentation: block: document error injection delay feature

Miaoqing Pan (1):
      mailmap: add entries for Miaoqing Pan

Michael Ellerman (1):
      riscv: defconfig: Disable COMPAT_BRK

Michael McAllister (1):
      Bluetooth: hci_mrvl: Leave the serdev port lifetime to hci_serdev

Michael S. Tsirkin (1):
      vhost: split out-of-order used ring batches at every wrap

Michal Blaszczyk (1):
      sched: Lift cgroup update locking to core to prevent CFS/SCX divergen=
ce

Michal Luczaj (8):
      selftests/bpf: Remove sockmap update from bpf_iter_unix
      bpf, sockmap: Restrict iter-context sockmap updates to iter/sockmap
      selftests/bpf: Add negative test for sockmap update from non-sockmap =
iter
      bpf, docs: Document BPF_ITER_NOSLEEP
      bpf: Restrict bpf_sock_destroy() to iter/{tcp,udp}
      bpf: Mark bpf_iter__sockmap::sk as PTR_TRUSTED
      selftests/bpf: Add iter/sockmap bpf_sock_destroy() negative test
      bpf: Fix "unresolved symbol tcp_request_sock" build error

Micka=C3=ABl Sala=C3=BCn (13):
      landlock: Factor out capability denial checks
      landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
      landlock: Mediate CAP_SETPCAP for inheritable capabilities
      landlock: Mediate CAP_SYS_ADMIN for the admin memory reserve
      selftests/landlock: Test capability checks outside the capable hook
      landlock: Fix capability restriction documentation
      capabilities: Check PR_SET_SECUREBITS with ns_capable()
      selftests/landlock: Test PR_SET_SECUREBITS mediation
      landlock: Distinguish namespace creation and entry denials
      landlock: Add capability objects to denial tracing
      selftests/landlock: Test namespace denial operations
      landlock: Document namespace denial operations
      clang-format: Fix formatting of guard()

Miguel Ojeda (2):
      objtool/rust: add more `noreturn` Rust functions for Rust 1.101.0
      x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds

Mika Westerberg (1):
      mailmap: update Mika Westerberg's email address

Mike Rapoport (Microsoft) (2):
      userfaultfd: clear uffd state in child PTEs if uffd is released
during fork
      mm/vma: undo userfaultfd unmap preparation when unmapping fails

Mikhail Malyshev (1):
      io_uring/io-wq: apply the current cpuset to new workers

Miklos Szeredi (10):
      fuse: fix possible UAF in fuse_direntplus_link()
      fuse: zero the partial EOF page in copy_file_range()
      selftests/fuse: test post-EOF page zeroing on copy_file_range()
      fuse: derive short read EOF from the request offset
      virtiofs: fix use-after-free of fs->tag on device removal
      virtiofs: disable request timeout
      virtiofs: zero the reply region of the argument buffer
      fuse: don't mark inode DAX without CONFIG_FS_DAX
      fuse: advertise support for DAX mappings
      fuse: limit name size in listxattr

Milan P. Gandhi (1):
      scsi: mpi3mr: Validate reply frame size bounds

Miro Kropacek (2):
      m68k: Fix atari mouse movement
      fbdev: atafb: Restrict SuperVidel handling to the Falcon

Mohamed Ahmed (3):
      drm/nouveau: do not return early from a synchronous VM_BIND
      drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2 io_mappi=
ng
      drm/nouveau/instmem: map only the part of BAR2 that is used

Mohammad Shahid (1):
      powerpc/perf/vpa-dtl: use GFP_ATOMIC for DTL buffer allocation

Moshe Shemesh (1):
      RDMA/mlx5: Skip vport context query on FW without ib_virt support

Muchun Song (4):
      mm: fix missing page-table destructor in pagetable_free()
      riscv/mm: fix hotplug page-table destructor handling
      riscv/mm: fix missing destructor for hotplug PUD tables
      arm64/mm: fix destructor for unconstructed hotplug page tables

Myeonghun Pak (1):
      iio: proximity: hx9023s: Allocate trigger before requesting IRQ

Naman Jain (1):
      mailmap: update email address for Naman Jain

Narayana Murty N (1):
      KVM: PPC: Fix TOCTOU kernel stack disclosure via kvm_run->mmio.len

Nathan Chancellor (6):
      powerpc/smp: Handle of_property_count_u32_elems() error in
parse_thread_groups()
      rcu/nocb: Avoid unsequenced accesses to jiffies in show_rcu_nocb_stat=
e()
      mptcp: Avoid unsequenced accesses to jiffies in mptcp_reset_tout_time=
r()
      net: microchip: encx24j600: Avoid unsequenced accesses to
jiffies in encx24j600_tx()
      qca_spi: Avoid unsequenced accesses to jiffies in
qcaspi_netdev_tx_timeout()
      powerpc/xmon: Avoid unsequenced accesses to tsk in show_task()

NeilBrown (1):
      fuse: Use d_alloc_trylock() in fuse_direntplus_link()

Nguyen Ngoc Thang (1):
      Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock

Nicholas E. Andrade (1):
      ASoC: amd: acp: fix PDM ring buffer address on ACP7.x resume

Nick Spooner (1):
      ata: libata-scsi: fix REQUESTED MAX LBA field for REMOVE ELEMENT
AND TRUNCATE

Nickolai Zeldovich (2):
      riscv: mm: Define PAGE_KERNEL_RO
      xarray: clear the new head's parent before freeing the old head

Nikhil Gautam (1):
      iio: atlas-ezo: Fix humidity channel read support

Niklas Cassel (1):
      ata: libata-scsi: fix the INC_512 bit test for SECURITY PROTOCOL IN/O=
UT

Niklas Neronin (2):
      usb: xhci: clear stale bandwidth data after hibernation
      usb: xhci: fix 'num_active_eps' accounting on allocation failure

Nikolaos Gkarlis (2):
      RDMA/nldev: Reply to RDMA_NLDEV_CMD_PORT_GET with its own command
      RDMA/nldev: Reply to RDMA_NLDEV_CMD_STAT_DEL with its own command

Olivier Kaloudoff (1):
      usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)

Omar Ramadan (6):
      amt: stop receiving before amt_dev_stop() tears down its state
      amt: fix use-after-free when a Membership Update re-arms a freed tunn=
el
      amt: reject a gateway Query or Data from 0.0.0.0 before a relay is le=
arned
      amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
      amt: make pre-query report drops visible
      amt: create relay tunnels only from authenticated Updates

Orkun Emin Sar=C4=B1 (1):
      fuse: don't pass a NULL inode to fuse_inode_backing() on release

Ovidiu Bunea (1):
      drm/amd/display: Add support for more PSP footer sizes

Paul Menzel (1):
      drm/amd/display: Don't warn about vendor infoframe for non-infoframe =
sinks

Paul Moses (2):
      perf record: Reject CPU indices equal to the mask size
      perf record: Skip affinity for per-thread mmap buffers

Peder Bergan (1):
      rust: str: tie Formatter to its backing buffer

Pengfei Li (1):
      tracing: Wait for marker writers when copy_trace_marker is cleared

Peter Zijlstra (2):
      sched/fair: Use guard in sched_group_set_idle()
      sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle

Piotr Pi=C3=B3rkowski (1):
      drm/xe/guc: Reset TLB invalidation state in submit fini

Piyus Kedia (1):
      Bluetooth: L2CAP: clear the SDU before the receive callback

Platon Miller (1):
      nvme-pci: merge duplicate 1d97:2263 entries in nvme_id_table

Praneeth Balasubramanian (1):
      scsi: target: iscsi: Check for existing sessions only after authentic=
ation

Prike Liang (1):
      drm/amdgpu: keep reading the vblank counter in IRQ context during res=
et

Qiang Han (1):
      drm/amdkfd: wait for the queue quiesce in concurrent SVM evictions

Qianghua Wang (1):
      ASoC: sn624x: add support for the SN6245 part ID

Qiliang Yuan (1):
      nvme: remove namespaces in parallel

Radhey Shyam Pandey (3):
      usb: dwc3: xilinx: fix system suspend and resume PHY handling
      usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
      usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and r=
emove

Rafael J. Wysocki (2):
      ACPI: CPPC: Drop compliance checks involving nominal performance
      ACPI: PM: Avoid initializing power management for absent devices

Riana Tauro (1):
      drm/xe/ras: Treat non-fatal PCIe errors as recovered

Richard Cheng (1):
      cxl/port: Fix endpoint RAS error unmasking

Richard Fitzgerald (2):
      ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
      ASoC: cs35l56: Fix unwanted writes to ASP config registers

Richard Weinberger (1):
      x86/Kconfig: Enable ROX also when STRICT_KERNEL_RWX is present

Ridong Chen (3):
      mm/migrate: move NR_FILE_THPS on cross-node migration
      mm/migrate: move NR_KERNEL_FILE_PAGES on cross-node migration
      mailmap: add entries for Ridong Chen

Rik van Riel (1):
      xfs: keep successful near rt allocations

Rishabh Jain (1):
      usb: pci-quirks: always assert xHCI OS ownership

Ritesh Harjani (IBM) (7):
      KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
      KVM: PPC: Book3S: Don't call __ffs() on an empty pending_exceptions b=
itmap
      KVM: PPC: BookE: Don't call __ffs() on an empty pending_exceptions bi=
tmap
      KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit
      KVM: PPC: Book3S HV nestedv2: reject vCPU ids beyond the PAPR limit
      KVM: PPC: Book3S HV: Fix error handling during vcore create
      KVM: PPC: Book3s: nestedv2: Free the guest state buffers if vcpu
create fails

Rosen Penev (2):
      hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take
      hwmon: (dell-smm) Reject out-of-range pwm values

Ruben Wauters (1):
      MAINTAINERS: Update Ruben Wauters email address

Ryan Roberts (2):
      arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
      arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list

SJ Park (1):
      selftests/damon/sysfs_memcg_path_leak: define ksft_skip

Saad Anjum (1):
      pinctrl: mediatek: common-v2: Fix of_iomap() error check

Sai Teja Aluvala (1):
      mailmap: update email address for Sai Teja Aluvala

Salah Triki (1):
      iio: temperature: mlx90614: Fix dual channel probe condition check

Sang-Heon Jeon (1):
      fault-inject: fix boot failure with fault injection boot parameters

Sanjay Yadav (1):
      drm/xe/query: Use ordered clock reads for engine cycles cpu_delta

Sankara Tankala (1):
      thermal: int340x: processor_thermal: Fix Nova Lake-S PCI device ID

Saravanan Vajravel (1):
      RDMA/bnxt_re: Drop RCFW completions for cookies with no
outstanding command

Sasha Levin (1):
      selftests/powerpc: override EMIT_TESTS instead of the emit_tests rule

Sebastian Reichel (1):
      spi: Fix runtime PM imbalance on pump transfer message error

Selvin Xavier (7):
      RDMA/bnxt_re: Clear stale RCFW resp pointer when wait ends
      RDMA/bnxt_re: Honor a completion that races with a wait timeout
      RDMA/bnxt_re: Do not treat CQ error notification as a command complet=
ion
      RDMA/bnxt_re: Reset cqe pointer each poll_cq iteration
      RDMA/bnxt_re: Remove shared page mmap entry on alloc_ucontext failure
      RDMA/bnxt_re: Bound FRMR page list by max_num_sg
      RDMA/uverbs: Zero the QP attrs in ib_uverbs_query_qp

Sergei Kuznetsov (1):
      Input: xpad - add GameSir G7 Pro support

Sergei Nizovtsev (1):
      bpf, lsm: Mark backing_file_alloc/free LSM hooks as untrusted

Serhat Kumral (1):
      RDMA/mthca: Fix off-by-one in mthca_map_user_db()

Shakeel Butt (4):
      bpf, cgroup: Don't read freed effective arrays in BPF_PROG_QUERY
      bpf, cgroup: Don't attach to a removed cgroup
      bpf, cgroup: Protect cgroup_bpf state with its own mutex
      bpf, cgroup: Don't lose errors in effective BPF_LSM_CGROUP queries

Shao Mingyin (18):
      nvmet: zero the entire Get Log Page transfer buffer
      nvmet: zns: return the namespace lookup error for Identify
      scsi: target: Fix NULL pointer dereference in
target_dev_alua_lu_gp_store()
      scsi: target: Fix NULL pointer dereference in
core_alua_do_port_transition()
      scsi: rdac: Keep the error status when controller lookup fails
      nvme: reject invalid reconnect_delay sysfs values
      ublk: validate all parameters for zoned devices
      ublk: dispatch the next fetch after a batch failure
      nvme-auth: use the parsed offset for the DH-CHAP key
      nvmet: handle short reads and writes in the file backend
      nvmet: use overflow-safe range checks in the file backend
      nvmet-auth: store the DH-CHAP key offset instead of hardcoding it
      nvme-loop: release the target request when SG setup fails
      nvmet-tcp: only wait for in-capsule data for inline SGLs
      nvme-tcp: require the R2T offset to match the data sent
      nvmet-fcloop: free the LS request when delivery fails
      nvmet-fc: reject duplicate queue IDs on Create Connection
      nvmet: roll back queue bindings on connection failure

Shashank Mohan Jain (2):
      iio: magnetometer: mmc35240: leave cache-only mode before the cache s=
ync
      iio: magnetometer: mmc5633: leave cache-only mode before the cache sy=
nc

Shawn Lin (1):
      scsi: ufs: rockchip: Improve RX noise immunity

Shay Drory (3):
      RDMA/mlx5: Add missing error flow in mlx5_ib_set_vport_rep
      net/mlx5: IFC, enlarge active_port field to support 8 port LAG
      net/mlx5e: rep, Fix races between devcom PAIR event and uplink close

Shihuang Liu (1):
      bpf: Check variable-offset accesses against special fields

Shrikanth Hegde (3):
      PPC32: Fix hard_irq_disable to follow tracing and lockdep state
      KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
      KVM: PPC: Hard disable interrupts before guest entry

Shuai Zhang (2):
      Bluetooth: hci_qca: Reopen the UART after enabling QCA2066
      Bluetooth: hci_qca: Don't use the serdev port after a failed reopen

Shunbo Shi (1):
      fuse: fix UBSAN warning in fuse_iomap_writeback_range()

Siddharth Chintamaneni (5):
      io_uring/kbuf: initialize arg->out_len from arg->max_len in
io_buffers_select()
      af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
      selftest: af_unix: Test scm_fds on dgram disconnect.
      smb: client: fix busy dentry and inode on unmount from late oplock br=
eak
      smb: client: fix busy dentry on unmount from persistent handle reopen

Simon Schippers (2):
      veth: wake a stopped peer txq beyond real_num_tx_queues
      veth: wake the peer txq when deleting NAPI

Sinan Turunc (2):
      ALSA: usx2y: Count completions apart from the URB array length
      ALSA: usx2y: Account for every period a URB completes

Sonali Pradhan (1):
      usb: gadget: f_midi: fix UAF race during IN request handling

Song Liu (1):
      rcu-tasks: Use pr_debug() for callback contend/collapse messages

Sreeraj S Kurup (5):
      ALSA: compress: Set metadata_set only after successful callback
      nvmet: clean up DH group state on initialization failure
      nvmet: reject invalid write-protect feature values
      nvmet: synchronize DH-CHAP secret removal
      ALSA: memalloc: Fix DMA allocation retry cleanup

Srinivas Pandruvada (1):
      iio: hid-sensors: fix fractional part for unit exponents -7 and -8

Stanley Jhu (7):
      scsi: ufs: core: Keep clock-gating hold on failed W-LUN runtime resum=
e
      scsi: ufs: core: Restore jiffies conversion of device management time=
outs
      scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper
      scsi: ufs: sysfs: Propagate runtime PM resume errors
      scsi: ufs: bsg: Abort ufs_bsg_request() when runtime resume fails
      scsi: ufs: hwmon, debugfs: Propagate runtime PM resume errors
      block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when already activ=
e

Stefan Binding (1):
      ALSA: hda: cs35l41: Correct Boost values for several laptops
with overridden ACPI

Steffen A. Mork (1):
      fbdev: fm2fb: Fix iomem access

Stephen Smalley (1):
      selinux: check MAP_SHARED_VALIDATE mappings as shared

Steven Rostedt (3):
      fgraph: Read the task->ret_stack with a smp_load_acquire()
      tracing: Do not allow user events to add a system name
      tracing: Add notrace to event functions that hook to ftrace

Sumit Gupta (1):
      cpufreq: CPPC: Set CPPC Enable register in cpu_init()

Sun Yuechi (1):
      PCI: Ignore Immediate Readiness on Samsung PM9D3a NVMe

Sung Byeongchan (1):
      ieee802154: require CAP_NET_ADMIN for SIOCSIFADDR

Suraj Gupta (1):
      MAINTAINERS: Add Suraj Gupta as AXI Ethernet co-maintainer

Suresh Guttula (1):
      drm/amdgpu: bypass IMU ucode loading for GC 11 APU

Suyuan Wang (3):
      smb: client: fail SMB2 responses with a bad signature
      fbdev: cobalt_lcdfb: Don't read info after framebuffer_release()
      smb: client: don't use read data that failed signature verification

Svyatoslav Nikolenko (1):
      net: e1000: fix warning in iounmap on probe failure

TAKANO Mitsuhiro (1):
      perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_MEM_FAULT

Takashi Iwai (2):
      ALSA: hda/realtek: Fix regression on Lenovo Legion 16IRX9H
      ASoC: tas2781: Avoid possible zero-division

Theodor Arsenij Larionov Trichkine (2):
      ipvs: ftp: skip conntrack templates in ip_vs_ftp_out
      fou: reserve headroom before pushing the encap header

Thinh Nguyen (9):
      MAINTAINERS: take over dwc2 maintainership
      usb: dwc3: trace: Restore request name assignment
      usb: dwc3: gadget: Reject requests to a disabled endpoint
      usb: dwc3: gadget: Track a timed out End Transfer
      usb: dwc3: gadget: Clear delayed stop on End Transfer completion
      usb: dwc3: gadget: Issue no-op Start Transfer only for stream endpoin=
ts
      usb: dwc3: gadget: Wait for End Transfer completion on ep disable
      usb: dwc3: gadget: Reset endpoint flags on controller start
      usb: dwc3: gadget: Recover from End Transfer timeout

Thomas Hellstr=C3=B6m (1):
      drm/xe/dma-buf: Validate BOs on export to charge the exporter

Thomas Lamprecht (1):
      drm/amd/display: Don't warn about links without an HPD GPIO

Thomas Zimmermann (2):
      drm/vblank: timer: Do not block within critical section
      drm/vblank: Cancel vblank timer outside of critical section

Tim Douglas (2):
      fbdev: macmodes: compare the pixel clock of each candidate mode
      fbdev: valkyriefb: keep the framebuffer mapping size fixed

Tim Surber (1):
      ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode

Tingmao Wang (1):
      landlock: Add missing EINVAL case in the doc for landlock_add_rule

Tomas M (1):
      drm/vmwgfx: include legacy hotspots in GB-only cursor images

Tomeu Vizoso (1):
      accel/rocket: Fix up sched array handling on open and close

Tony Luck (2):
      x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models
      x86/resctrl: Add SNC support for Granite Rapids "D" CPU

Triet Hoang (2):
      accel/rocket: Check allocations before use
      accel/rocket: Keep scheduler allocation in rocket_file_priv

Tristan Madani (1):
      USB: serial: sierra: validate URB length in instat callback

Umang Pokhriyal (1):
      userfaultfd: validate the whole range before changing write protectio=
n

Uttkarsh Aggarwal (1):
      usb: typec: ucsi: Set ucsi->connector before enabling notifications

Valerio Setti (3):
      ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

Vidhu Sarwal (1):
      iio: humidity: am2315: fix negative temperature decoding

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/cdclk: Ignore SWF18 in SKL CDCLK sanitization

Vincent Donnefort (5):
      ring-buffer: Skip remote reader page swap when on tail
      ring-buffer: Check remote reader page commit before meta entries
      ring-buffer: Order remote page commit with data and timestamp
      ring-buffer: Increment pages_read on remote ring buffer page swap
      tracing: Take trace_access_lock() in tracing_buffers_ioctl()

Vineet Gupta (3):
      ARC: io: work around GCC PR127718 in __raw_write{w,l}()
      fgraph: Allocate shadow stacks inline with GFP_NOWAIT
      fgraph: Use scoped_guard() for the task list walk

Viral Patel (1):
      iio: magnetometer: tlv493d: fix magnetic field scale

Vladimir Kondratiev (1):
      riscv: unaligned: fix __setup handlers

Vladimir Petrzhikovskii (1):
      virtio_net: check RX buffer length before DMA sync

Vladimir Popov (1):
      drm/vmwgfx: fix NULL pointer dereference in vmw_validation_bo_fence()

V=C3=ADtor Hugo Silva (1):
      hwmon: (ads7871) Add error handle from spi_setup()

Wajeeh Atrash (1):
      net: ena: set admin device pointer before queue allocations

Wang Haoran (1):
      IB/usnic: fix wild pointer dereference in usnic_ib_qp_grp_dump_rows()

Wang Jiang (1):
      drm/amdgpu/gfx_v9_0: Add gfxoff quirk for Lenovo Picasso 318F

Wang Xiaolei (1):
      mm/damon/tests/sysfs-kunit: fix leaked pid reference in add_targets t=
est

Wang Yibo (1):
      mailmap: add Wang Yibo's work email address

Wayne Ho (1):
      hwmon: (sht3x) Fix overflow when writing alert limits

Weihong Guan (5):
      Bluetooth: hci_sync: Set random address on the set's handle
      Bluetooth: hci_sync: Remove an advertising set by its handle
      Bluetooth: hci_core: Add hci_free_adv_instance()
      Bluetooth: hci_event: Find the owner of a terminated adv set
      Bluetooth: hci_sync: Drop the command's sk reference

Weiming Shi (1):
      fbdev: vfb: Validate framebuffer geometry and memory size

WeitaoWang-oc (1):
      x86/apic/msi: Fix MSI interrupt affinity configuration

Wenbo Sun (2):
      net: dcb: flush rewrite table on device unregister
      team: validate the length of U32 and S32 option data

Wenjing Liu (1):
      drm/amd/display: Read DRAM channel width from SMU init table

Wentao Liang (1):
      Input: cyapa - fix runtime PM leak in cyapa_update_rt_suspend_scanrat=
e()

Wenwu Hou (1):
      tracing/hwlat: Do the latency calculations in nanoseconds

Xin Long (1):
      sctp: validate SACK pull length against chunk length, not skb length

Xu Rao (2):
      usb: xhci: disable the correct slot on alloc_dev failure
      Bluetooth: MGMT: Fix runtime config status opcode

Xuanqiang Luo (3):
      iavf: fix QoS capabilities memory leak
      iavf: fix ASQ command buffer leak on init failure
      iavf: add missing PTP adjustment callbacks

Xue Haolin (1):
      fbdev: sstfb: Error out if pixclock equals zero

Yang Xiuwei (3):
      io_uring: fail soft links on negative IOU_COMPLETE results
      io_uring/futex: fail soft links when cancelling a wait
      io_uring/rw: fail soft links on IOPOLL short or error IO

Yao Yiqi (1):
      fbcon: Avoid cancel_delayed_work_sync() in atomic context

Yaohan Li (1):
      nvme: stop asynchronous event work before ANA teardown

Ye Weihua (2):
      ALSA: pcm: oss: Restore params flag after failed reconfiguration
      ALSA: pcm: oss: Clear params flag only after successful setup

Yehyeong Lee (3):
      RDMA/srpt: bound the indirect descriptor table to the IU
      RDMA/srpt: reject zero-length buffer descriptors
      RDMA/srpt: widen the indirect RDMA context counters

Yingjie Wang (1):
      nvme: avoid wrapping admin_timeout and io_timeout

Yiqing Wu (2):
      xfs: remove unused variable in xchk_stats_estimate_bufsize()
      xfs: remove unused variable in xrep_tempfile_copyin()

Yiyu Zhou (1):
      xhci: give back TDs and clean up ep0 after disconnect

Youssef Samir (1):
      accel/qaic: Harden checks in BO execute and wait IOCTLs

Yu Zhang (1):
      usb: gadget: f_mass_storage: take filesem in nofua store to fix
backing-file UAF

Yu-Hsiang Tseng (1):
      iio: acpi: Accept comma separated values in ROTM strings

Yuan Yao (1):
      Input: trackpoint - add new TP JYT_NDT device variant id 7

YuanZhe Liu (4):
      usb: usbtest: prevent divide by zero in simple_io() with zero length
      fbdev: smscufx: don't free registered framebuffer on probe error
      fbdev: smscufx: keep the usb_device alive while ufx_data is in use
      fbdev: smscufx: allocate the size advertised in smem_len

Yuho Choi (1):
      nvme-pci: shut down the controller if disabling the HMB fails on susp=
end

Yunhui Cui (1):
      riscv: Fix SR_SUM leakage across context switches

Yves Bieri (1):
      sctp: do not free a new asoc peeled off while sendmsg slept

Zack Rusin (11):
      drm/vmwgfx: validate command body sizes before parsing
      drm/vmwgfx: validate backup buffer size in command buffer processing
      drm/vmwgfx: avoid underflow when stripping short GuestInfo replies
      drm/vmwgfx: bound MKSSTAT lengths before rounding to pages
      drm/vmwgfx: keep cursor mappings and pins with each plane state
      drm/vmwgfx: validate GB-only cursor command limits
      drm/vmwgfx: reserve dumb buffers while detaching their surfaces
      drm/vmwgfx: validate the framebuffer selected for cursor updates
      drm/vmwgfx: reserve cursor MOBs before unpinning them
      drm/vmwgfx: log missing primary planes only once
      drm/vmwgfx: log MOB limits outside the manager spinlock

Zhang Heng (5):
      ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
      ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP9
      ALSA: hda/realtek: Enable mute LEDs on HP Laptop 15-fd1xxx
      ALSA: hda/realtek: Fix quiet speakers on HP 250 G6

Zhao Feng (1):
      watchdog: npcm: fix sleeping clock call in restart handler

Zhao Li (1):
      Bluetooth: hci_serdev: serialize flush with transmit work

Zhiyuan Zhang (1):
      ocfs2: fix kernel BUG in ocfs2_page_mkwrite() when write_end fails

Zhongqiu Han (1):
      cpufreq: Skip inactive policies in cpufreq_driver_target()

Zi Yan (1):
      mm/huge_memory: prevent losing PG_waiters in __split_folio_to_order()

Zihan Xi (2):
      ipvs: avoid stack overflow from recursive connection expiration
      ipvs: reject FTP control ports as data ports

Ziheng Wei (3):
      hwmon: (nct6775) Fix incorrect struct cast in beep callbacks
      hwmon: (w83791d) Fix incorrect struct cast in show_temp1() and
store_temp1()
      hwmon: (w83792d) Fix incorrect struct cast in show_temp1() and
store_temp1()

Zongyao Bai (1):
      drm/xe/guc: Treat CT-disabled TLB invalidation as cancelled

Zxyan Zhu (1):
      net: stmmac: re-enable on-chip parity checkers for XGMAC ASP 0x2

koraynilay (2):
      smb: client: fix negative timestamps being read from smb
      smb: client: fix times assignments in cifs_posix_to_fattr()

orkunsari (1):
      nfsd: unlock the locked parent after crossing a mount in CREATE

ozgun kultekin (1):
      smb: client: do not let the server grow a write subrequest

suso (1):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U

yzddMr6 (1):
      ASoC: qcom: q6dsp-lpass-clocks: Set driver data before registering cl=
ocks
